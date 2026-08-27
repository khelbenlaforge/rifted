import { Date } from "./Date"
import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { resolveRelative } from "../util/path"
import { i18n } from "../i18n"

const limit = 100

const Changelog: QuartzComponent = ({ allFiles, cfg, fileData }: QuartzComponentProps) => {
  const entries = allFiles.slice(0, limit)

  return (
    <article class="popover-hint changelog">
      <p>Notes are listed by their most recent change.</p>
      {allFiles.length > limit && <p>Showing the latest {limit} notes.</p>}
      <ul class="section-ul">
        {entries.map((page) => {
          const created = page.dates?.created
          const modified = page.dates?.modified
          const isNew = created?.getTime() === modified?.getTime()
          const title = page.frontmatter?.title ?? i18n(cfg.locale).propertyDefaults.title

          return (
            <li class="section-li">
              <div class="section">
                <p class="meta">{modified && <Date date={modified} locale={cfg.locale} />}</p>
                <div class="desc">
                  <h3>
                    <a href={resolveRelative(fileData.slug!, page.slug!)} class="internal">
                      {title}
                    </a>
                  </h3>
                </div>
                <div class="changelog-tag">
                  <span class={isNew ? "changelog-status new" : "changelog-status updated"}>
                    {isNew ? "New" : "Updated"}
                  </span>
                </div>
              </div>
            </li>
          )
        })}
      </ul>
    </article>
  )
}

Changelog.css = `
.changelog-status {
  display: inline-block;
  padding: 0.1rem 0.4rem;
  border-radius: 0.25rem;
  font-size: 0.75rem;
  font-weight: 600;
}

.changelog-status.new {
  background: var(--tertiary);
  color: var(--light);
}

.changelog-status.updated {
  background: var(--secondary);
  color: var(--light);
}
`

export default (() => Changelog) satisfies QuartzComponentConstructor
