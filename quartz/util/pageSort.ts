import type { SortFn } from "../components/PageList"
import { isFolderPath } from "./path"

const alphabeticalCompareOptions: Intl.CollatorOptions = {
  numeric: true,
  sensitivity: "base",
}

export const alphabeticalFolderFirstSort: SortFn = (f1, f2) => {
  const f1IsFolder = isFolderPath(f1.slug ?? "")
  const f2IsFolder = isFolderPath(f2.slug ?? "")
  if (f1IsFolder && !f2IsFolder) return -1
  if (!f1IsFolder && f2IsFolder) return 1

  const f1InTimeline = f1.slug?.startsWith("Timeline/")
  const f2InTimeline = f2.slug?.startsWith("Timeline/")
  if (f1InTimeline && f2InTimeline) {
    return (f1.slug ?? "").localeCompare(f2.slug ?? "", undefined, alphabeticalCompareOptions)
  }

  return (f1.frontmatter?.title ?? "").localeCompare(
    f2.frontmatter?.title ?? "",
    undefined,
    alphabeticalCompareOptions,
  )
}
