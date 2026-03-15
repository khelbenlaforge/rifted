import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { classNames } from "../util/lang"

const PlayerNote: QuartzComponent = ({ fileData, displayClass }: QuartzComponentProps) => {
  const title = fileData.frontmatter?.title ?? fileData.slug?.split("/").pop() ?? "this page"
  const tallyUrl = `https://tally.so/r/A782al?Page=${encodeURIComponent(title)}`

  return (
    <div class={classNames(displayClass, "player-note")}>
      <a href={tallyUrl} target="_blank" rel="noopener noreferrer" class="player-note-link">
        ✏️ Wiki Notes
      </a>
    </div>
  )
}

PlayerNote.css = `
.player-note {
  margin: 1.5rem 0 0.5rem 0;
}

.player-note-link {
  display: inline-block;
  padding: 0.4rem 0.9rem;
  border-radius: 6px;
  font-size: 0.85rem;
  font-family: var(--bodyFont);
  text-decoration: none;
  border: 1px solid var(--darkgray);
  color: var(--darkgray);
  transition: background-color 0.15s ease, color 0.15s ease;
}

.player-note-link:hover {
  background-color: var(--highlight);
  color: var(--dark);
  border-color: var(--dark);
}
`

export default (() => PlayerNote) satisfies QuartzComponentConstructor
