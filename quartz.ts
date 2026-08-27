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
// emitter.ts that filePath is set from the file's relativePath, which is NOT run through
// v5's slugifyFilePath()/.toLowerCase(), unlike .slug. So this stays case-sensitive
// ("Timeline/"), unlike pageSort.ts's alphabeticalFolderFirstSort which checks .slug and
// must be case-insensitive.
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
// `defaults` override is a shallow merge at the FullPageLayout key level (left/right/etc),
// so overriding `left` means reconstructing the whole column, not just swapping one entry —
// this mirrors quartz.config.yaml's left-column plugin list/priorities exactly (page-title 10,
// spacer 25/mobile-only, search+darkmode+reader-mode grouped into the toolbar Flex at 20/30/35,
// explorer 50 with the custom sortFn, five-e-tools 60). Keep both in sync if either changes.
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
      FiveETools(),
    ],
  },
})
