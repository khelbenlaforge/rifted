import { loadQuartzConfig, loadQuartzLayout } from "./quartz/plugins/loader/config-loader"
import {
  Explorer,
  FolderPage,
  TagPage,
  TagContent,
  PageTitle,
  Search,
  Darkmode,
  ReaderMode,
  FiveETools,
  SessionNotes,
  ChangelogLink,
} from "./.quartz/plugins"
import type { ExplorerOptions } from "./.quartz/plugins"
import { MobileOnly, Spacer, Flex } from "./quartz/components"
import { alphabeticalFolderFirstSort } from "./quartz/util/pageSort"

// Timeline month files are titled without their chronological sort-key prefix
// (e.g. "Rifted - 222 PA - Uktar"), so the default alphabetical-by-title sort
// puts Nightal before Uktar. Sort those files by filename/slug instead, which
// keeps the "222.14"/"222.15"/"222.17" prefix — same convention Obsidian's own
// file explorer already relies on.
//
// Checks node.data.filePath (not .slug) — confirmed via @quartz-community/content-index's
// emitter.ts that filePath is set from the file's relativePath. Stays case-sensitive
// ("Timeline/"), matching v4 exactly. (Real .slug values also preserve case in practice —
// see the correction note in quartz/util/pageSort.ts — so this would work checking .slug too,
// but filePath was already known-safe and there was no reason to change it.)
const explorerSortFn: ExplorerOptions["sortFn"] = (a, b) => {
  if ((!a.isFolder && !b.isFolder) || (a.isFolder && b.isFolder)) {
    const aInTimeline = (a.data?.filePath as string | undefined)?.includes("Timeline/")
    const bInTimeline = (b.data?.filePath as string | undefined)?.includes("Timeline/")
    if (aInTimeline && bInTimeline) {
      return (a.slugSegment ?? "").localeCompare(b.slugSegment ?? "", undefined, {
        numeric: true,
        sensitivity: "base",
      })
    }
    return (a.displayName ?? "").localeCompare(b.displayName ?? "", undefined, {
      numeric: true,
      sensitivity: "base",
    })
  }

  if (!a.isFolder && b.isFolder) {
    return 1
  } else {
    return -1
  }
}

const config = await loadQuartzConfig()

// FolderPage/TagPage `sort` is a JS callback and can't be expressed in quartz.config.yaml.
// Their factory closes over `opts` (including `sort`) at construction time and reads it later
// via that closure in the render component — patching a `.sort` property onto the already-built
// instance does nothing, since nothing reads it back off the instance. The only real override
// is to fully reconstruct these two instances (matching the YAML options — currently just
// `enabled: true`, no other options set) and replace, not patch, the YAML-built ones.
// @quartz-community/tag-page has its own bug on top of the above: the page-type dispatcher
// always calls `pageType.body(undefined)` (quartz/plugins/pageTypes/dispatcher.ts), and while
// FolderPage works around this by wrapping its body in a closure that ignores the dispatcher's
// arg and reads the real opts instead, TagPage's body is the raw, unconfigured TagContent
// constructor — so `sort`/`numPages` passed to TagPage() are silently discarded. Get the real
// instance (correct match/generate/layout/priority) from TagPage() and patch only body, applying
// FolderPage's same fix, rather than duplicating TagPage's ~50-line generate() logic by hand.
const tagPageInstance = TagPage({ sort: alphabeticalFolderFirstSort })
const fixedTagPage = {
  ...tagPageInstance,
  body: () => TagContent({ sort: alphabeticalFolderFirstSort }),
}

config.plugins.pageTypes = (config.plugins.pageTypes ?? [])
  .filter((pt) => pt.name !== "FolderPage" && pt.name !== "TagPage")
  .concat([FolderPage({ sort: alphabeticalFolderFirstSort }), fixedTagPage])

export default config

// Explorer's sortFn is likewise a JS callback that can't live in YAML. loadQuartzLayout()'s
// `defaults` override is a shallow merge at the FullPageLayout key level (left/right/etc), so
// overriding `left` means reconstructing the whole column for CONTENT pages, not just swapping
// one entry — this only affects `content`; folder/tag/changelog build their own `left`
// independently from quartz.config.yaml's per-plugin priorities (see the byPageType excludes
// there for why PlayerNote/SessionNotes/FiveETools don't appear on those page types, matching
// v4). Order here matches v4's original quartz.layout.ts left column exactly: PageTitle, Spacer,
// toolbar Flex, Explorer, ChangelogLink, SessionNotes, FiveETools.
export const layout = await loadQuartzLayout({
  defaults: {
    left: [
      PageTitle(),
      MobileOnly(Spacer()),
      Flex({
        components: [
          { Component: Search(), grow: true },
          { Component: Darkmode() },
          { Component: ReaderMode() },
        ],
      }),
      Explorer({ sortFn: explorerSortFn }),
      ChangelogLink(),
      SessionNotes(),
      FiveETools(),
    ],
  },
})
