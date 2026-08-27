import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { SimpleSlug, resolveRelative } from "../util/path"
import { classNames } from "../util/lang"

const ChangelogLink: QuartzComponent = ({ displayClass, fileData }: QuartzComponentProps) => (
  <a
    class={classNames(displayClass, "changelog-link", "internal")}
    href={resolveRelative(fileData.slug!, "changelog" as SimpleSlug)}
  >
    Changelog
  </a>
)

ChangelogLink.css = `
.changelog-link {
  display: inline-block;
  margin: 0.5rem 0;
  font-weight: 600;
}
`

export default (() => ChangelogLink) satisfies QuartzComponentConstructor
