import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { SimpleSlug, resolveRelative } from "../util/path"

const ChangelogLink: QuartzComponent = ({ fileData }: QuartzComponentProps) => (
  <div class="changelog-link-wrapper">
    <a class="changelog-link-btn" href={resolveRelative(fileData.slug!, "changelog" as SimpleSlug)}>
      🕒 Changelog
    </a>
  </div>
)

ChangelogLink.css = `
.changelog-link-wrapper {
  margin: 0.5rem 0;
}

.changelog-link-btn {
  display: block;
  width: 100%;
  padding: 0.4rem 0.9rem;
  border-radius: 6px;
  font-size: 0.85rem;
  font-family: var(--bodyFont);
  text-align: center;
  border: 1px solid var(--darkgray);
  color: var(--darkgray);
  background: transparent;
  cursor: pointer;
  text-decoration: none;
  transition: background-color 0.15s ease, color 0.15s ease;
  box-sizing: border-box;
}

.changelog-link-btn:hover {
  background-color: var(--highlight);
  color: var(--dark);
  border-color: var(--dark);
}
`

export default (() => ChangelogLink) satisfies QuartzComponentConstructor
