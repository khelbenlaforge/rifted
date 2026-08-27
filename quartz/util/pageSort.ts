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

// v5 lowercases URL slugs (@quartz-community/utils slugifyFilePath -> slugifyPath ->
// .toLowerCase()), unlike v4 — so the Timeline check must be case-insensitive here, unlike
// explorerSortFn in quartz.ts which checks filePath (not lowercased) and stays case-sensitive.
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
