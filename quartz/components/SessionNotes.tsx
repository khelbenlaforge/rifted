import { QuartzComponent, QuartzComponentConstructor } from "./types"

const SessionNotes: QuartzComponent = () => {
  return (
    <div class="session-notes">
      <button
        class="session-notes-btn"
        onclick="document.getElementById('session-notes-modal').style.display='flex'"
      >
        ✏️ Session Notes
      </button>

      <div
        id="session-notes-modal"
        class="session-notes-modal"
        onclick="if(event.target===this)this.style.display='none'"
      >
        <div class="session-notes-modal-content">
          <button
            class="session-notes-close"
            onclick="document.getElementById('session-notes-modal').style.display='none'"
            aria-label="Close"
          >
            ✕
          </button>
          <iframe
            src="https://tally.so/embed/xXZMBd?hideTitle=1"
            width="100%"
            height="560"
            frameborder="0"
            marginheight="0"
            marginwidth="0"
            title="Session Notes"
          />
        </div>
      </div>
    </div>
  )
}

SessionNotes.css = `
.session-notes {
  margin: 0.5rem 0;
}

.session-notes-btn {
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
  transition: background-color 0.15s ease, color 0.15s ease;
}

.session-notes-btn:hover {
  background-color: var(--highlight);
  color: var(--dark);
  border-color: var(--dark);
}

/* Modal overlay */
.session-notes-modal {
  display: none;
  position: fixed;
  inset: 0;
  z-index: 9999;
  background: rgba(0, 0, 0, 0.55);
  align-items: center;
  justify-content: center;
}

/* Modal box */
.session-notes-modal-content {
  position: relative;
  width: min(520px, 92vw);
  max-height: 85vh;
  border-radius: 10px;
  overflow: hidden;
  border: 1px solid var(--lightgray);
  background: var(--light);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.35);
}

.session-notes-modal-content iframe {
  display: block;
}

/* Close button */
.session-notes-close {
  position: absolute;
  top: 0.5rem;
  right: 0.6rem;
  z-index: 1;
  background: transparent;
  border: none;
  font-size: 1rem;
  color: var(--darkgray);
  cursor: pointer;
  line-height: 1;
  padding: 0.2rem 0.4rem;
  border-radius: 4px;
  transition: color 0.15s ease, background-color 0.15s ease;
}

.session-notes-close:hover {
  color: var(--dark);
  background-color: var(--highlight);
}
`

SessionNotes.afterDOMLoaded = `
  document.addEventListener("keydown", function(e) {
    if (e.key === "Escape") {
      const modal = document.getElementById("session-notes-modal");
      if (modal) modal.style.display = "none";
    }
  });
`

export default (() => SessionNotes) satisfies QuartzComponentConstructor
