import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { classNames } from "../util/lang"

const PlayerNote: QuartzComponent = ({ fileData, displayClass }: QuartzComponentProps) => {
  const title = fileData.frontmatter?.title ?? fileData.slug?.split("/").pop() ?? "this page"
  const tallyEmbedUrl = `https://tally.so/embed/A782al?hideTitle=1&transparentBackground=1&Page=${encodeURIComponent(title as string)}`

  return (
    <div class={classNames(displayClass, "player-note")}>
      <input type="checkbox" id="player-note-toggle" class="player-note-checkbox" />
      <label for="player-note-toggle" class="player-note-btn">✏️ Wiki Notes</label>
      <div class="player-note-embed">
        <iframe
          src={tallyEmbedUrl}
          width="100%"
          height="520"
          frameborder="0"
          marginheight="0"
          marginwidth="0"
          title="Wiki Notes"
        />
      </div>
    </div>
  )
}

PlayerNote.css = `
.player-note {
  margin: 1.5rem 0 0.5rem 0;
}

.player-note-checkbox {
  display: none;
}

.player-note-btn {
  display: inline-block;
  padding: 0.4rem 0.9rem;
  border-radius: 6px;
  font-size: 0.85rem;
  font-family: var(--bodyFont);
  border: 1px solid var(--darkgray);
  color: var(--darkgray);
  cursor: pointer;
  transition: background-color 0.15s ease, color 0.15s ease;
}

.player-note-btn:hover {
  background-color: var(--highlight);
  color: var(--dark);
  border-color: var(--dark);
}

.player-note-embed {
  display: none;
  margin-top: 1rem;
  border: 1px solid var(--lightgray);
  border-radius: 8px;
  overflow: hidden;
}

.player-note-checkbox:checked ~ .player-note-embed {
  display: block;
}
`

export default (() => PlayerNote) satisfies QuartzComponentConstructor
