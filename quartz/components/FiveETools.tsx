import { QuartzComponent, QuartzComponentConstructor } from "./types"

const FiveETools: QuartzComponent = () => {
  return (
    <div class="fivetools">
      <a
        class="fivetools-btn"
        href="https://5e.tools"
        target="_blank"
        rel="noopener noreferrer"
      >
        📖 5etools
      </a>
    </div>
  )
}

FiveETools.css = `
.fivetools {
  margin: 0.5rem 0;
}

.fivetools-btn {
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

.fivetools-btn:hover {
  background-color: var(--highlight);
  color: var(--dark);
  border-color: var(--dark);
}
`

export default (() => FiveETools) satisfies QuartzComponentConstructor
