import type { QuartzPluginData } from "@quartz-community/types"
import { isFolderPath } from "./path"

const alphabeticalCompareOptions: Intl.CollatorOptions = {
  numeric: true,
  sensitivity: "base",
}

// Root @quartz-community/types@0.2.1 doesn't export SortFn (only nested plugin copies of the
// same declared version range do — a version-drift artifact of v5's per-plugin node_modules,
// same class of issue as the @types/hast duplication elsewhere). Inline the type instead of
// depending on a nested export; structurally identical to what FolderPage/TagPage's own SortFn
// (from @quartz-community/types, re-exported per-plugin) actually expects.
type SortFn = (f1: QuartzPluginData, f2: QuartzPluginData) => number

// CORRECTED (verified against the real CI build's static/contentIndex.json, 2026-08-27): the
// original "v5 lowercases URL slugs" premise here was WRONG. Real content file slugs preserve
// original case (302/341 entries in the actual build have uppercase chars) — only frontmatter
// `aliases:` entries get lowercased, via a separate code path (alias-redirects' own alias
// target computation), which is unrelated to a file's real canonical .slug. Three earlier
// review passes all read slugifyPath()'s .toLowerCase() correctly but never traced whether it's
// actually called for the primary content slug (it isn't) vs. only for alias targets (it is).
// This case-insensitive check is kept anyway since it's harmless (a case-insensitive match
// against an already-original-case "Timeline/" prefix still matches correctly) and gives some
// defensive margin, but do not treat "v5 lowercases slugs" as an established fact elsewhere.
export const alphabeticalFolderFirstSort: SortFn = (f1, f2) => {
  const f1IsFolder = isFolderPath(f1.slug ?? "")
  const f2IsFolder = isFolderPath(f2.slug ?? "")
  if (f1IsFolder && !f2IsFolder) return -1
  if (!f1IsFolder && f2IsFolder) return 1

  const f1InTimeline = f1.slug?.toLowerCase().startsWith("timeline/")
  const f2InTimeline = f2.slug?.toLowerCase().startsWith("timeline/")
  if (f1InTimeline && f2InTimeline) {
    return (f1.slug ?? "").localeCompare(f2.slug ?? "", undefined, alphabeticalCompareOptions)
  }

  return (f1.frontmatter?.title ?? "").localeCompare(
    f2.frontmatter?.title ?? "",
    undefined,
    alphabeticalCompareOptions,
  )
}
