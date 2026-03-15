import { QuartzComponent, QuartzComponentConstructor } from "./types"

const SessionNotes: QuartzComponent = () => {
  return (
    <div class="session-notes">
      <a href="https://tally.so/r/xXZMBd" target="_blank" rel="noopener noreferrer" class="session-notes-link">
        ✏️ Session Notes
      </a>
    </div>
  )
}

SessionNotes.css = `
.session-notes {
  margin: 0.5rem 0;
}

.session-notes-link {
  display: block;
  padding: 0.4rem 0.9rem;
  border-radius: 6px;
  font-size: 0.85rem;
  font-family: var(--bodyFont);
  text-decoration: none;
  text-align: center;
  border: 1px solid var(--darkgray);
  color: var(--darkgray);
  transition: background-color 0.15s ease, color 0.15s ease;
}

.session-notes-link:hover {
  background-color: var(--highlight);
  color: var(--dark);
  border-color: var(--dark);
}
`

export default (() => SessionNotes) satisfies QuartzComponentConstructor
