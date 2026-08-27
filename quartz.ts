import { loadQuartzConfig, loadQuartzLayout } from "./quartz/plugins/loader/config-loader"
import { PageTypeDispatcher } from "./quartz/plugins/pageTypes"
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

// CONFIRMED BUG, found by adversarial review + independently verified against the live site
// (Explorer sidebar was rendering alphabetical order and YAML-priority widget order, not this
// file's intended chronological sort / component order): `quartz/build.ts` only imports this
// file's DEFAULT export (`import cfg from "../quartz"`) — there is no consumer anywhere for a
// separate named `layout` export. Worse, `loadQuartzConfig()` above already calls
// `loadQuartzLayout()` INTERNALLY with NO arguments and bakes that un-overridden result into a
// `PageTypeDispatcher` pushed onto `config.plugins.emitters` (config-loader.ts, right before
// `loadQuartzConfig()` returns) — that dispatcher, not any layout export, is what actually
// renders every page. A `layout` named export sitting unconsumed next to `export default config`
// silently does nothing. The only way to make Explorer's sortFn (or any other JS-callback layout
// customization) actually take effect is to replace that already-baked-in dispatcher with one
// built from a correctly-overridden layout, before exporting config.
//
// Order here matches v4's original quartz.layout.ts left column exactly: PageTitle, Spacer,
// toolbar Flex, Explorer, ChangelogLink, SessionNotes, FiveETools. This only affects `content`;
// folder/tag/changelog build their own `left` independently from quartz.config.yaml's per-plugin
// priorities (see the byPageType excludes there for why PlayerNote/SessionNotes/FiveETools don't
// appear on those page types, matching v4).
// A second, deeper bug beyond the one described above: `loadQuartzLayout()`'s per-page-type
// loop rebuilds a FULL YAML-only layout for EVERY key present in quartz.config.yaml's
// `layout.byPageType` — including `content: {}`, which exists there as a (seemingly harmless)
// placeholder. `resolveLayout()` then does `overrides.left ?? sharedDefaults.left`, and since
// `content` is a declared byPageType key, `overrides.left` is that YAML-only array, never
// `undefined` — so `sharedDefaults.left` (the `defaults.left` override below) is ALWAYS ignored
// for content pages regardless of which dispatcher instance ends up used. Passing `byPageType:
// {content: {left: [...]}}` here too, not just `defaults`, is what actually makes this take
// effect — confirmed empirically (this was NOT caught by two rounds of static/code review,
// only by re-deriving the exact merge logic in loadQuartzLayout() line by line).
const leftColumn = [
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
]
const layout = await loadQuartzLayout({
  defaults: { left: leftColumn },
  byPageType: { content: { left: leftColumn } },
})

config.plugins.emitters = (config.plugins.emitters ?? []).filter(
  (e) => e.name !== "PageTypeDispatcher",
)
config.plugins.emitters.push(
  PageTypeDispatcher({ defaults: layout.defaults, byPageType: layout.byPageType }),
)

export default config
