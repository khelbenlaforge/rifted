import { FilePath, joinSegments, slugifyFilePath } from "../../util/path"
import { QuartzEmitterPlugin, QuartzPageTypePluginInstance } from "../types"
import path from "path"
import fs from "fs"
import { glob } from "../../util/glob"
import { Argv, BuildCtx } from "../../util/ctx"
import { QuartzConfig } from "../../cfg"

function getPageTypeExtensions(ctx: BuildCtx): Set<string> {
  const extensions = new Set<string>()
  const pageTypes = (ctx.cfg.plugins.pageTypes ?? []) as unknown as QuartzPageTypePluginInstance[]
  for (const pt of pageTypes) {
    if (pt.fileExtensions) {
      for (const ext of pt.fileExtensions) {
        extensions.add(ext)
      }
    }
  }
  return extensions
}

const filesToCopy = async (argv: Argv, cfg: QuartzConfig, excludeExtensions: Set<string>) => {
  const excludePatterns = ["**/*.md", ...cfg.configuration.ignorePatterns]
  for (const ext of excludeExtensions) {
    excludePatterns.push(`**/*${ext}`)
  }
  return await glob("**", argv.directory, excludePatterns)
}

const copyFile = async (argv: Argv, fp: FilePath) => {
  const src = joinSegments(argv.directory, fp) as FilePath

  // CONFIRMED BUG (2026-08-28): the site's root node_modules copy of @quartz-community/utils
  // and each individual plugin's own isolated node_modules copy of the SAME declared version
  // (0.1.0) produce genuinely different slugifyFilePath output for the identical input -
  // confirmed empirically (root: case-preserving "zzz_Attachments/Adon-Portrait.png"; the
  // obsidian-flavored-markdown plugin's own copy: fully lowercased
  // "zzz_attachments/adon-portrait.png"). Root cause: @quartz-community/utils is installed via
  // an unpinned git ref (package-lock.json: "resolved": "git+ssh://.../utils.git#<sha>"), not an
  // immutable npm registry release, so separate npm installs (root site vs each plugin's own,
  // run at different times during `plugin add`/`resolve`) can silently pull different commits
  // under the same static "version" field. alias-redirects' own docs describe lowercasing as
  // the intentional v5 design ("v5's lowercase slug normalization... canonical lowercase URL"),
  // and image-embed src generation (obsidian-flavored-markdown) consistently lowercases - so
  // this file (a core, tracked, non-regenerated file, unlike node_modules) is patched to match
  // that intended behavior explicitly, rather than relying on whatever the ambient dependency
  // resolution happens to produce. Without this, every embedded asset whose path contains any
  // uppercase character 404s, since the emitted <img src>/link never matches this copy destination.
  const name = slugifyFilePath(fp).toLowerCase()
  const dest = joinSegments(argv.output, name) as FilePath

  const dir = path.dirname(dest) as FilePath
  await fs.promises.mkdir(dir, { recursive: true })

  await fs.promises.copyFile(src, dest)
  return dest
}

export const Assets: QuartzEmitterPlugin = () => {
  return {
    name: "Assets",
    async *emit(ctx) {
      const excludeExtensions = getPageTypeExtensions(ctx)
      const fps = await filesToCopy(ctx.argv, ctx.cfg, excludeExtensions)
      for (const fp of fps) {
        yield copyFile(ctx.argv, fp)
      }
    },
    async *partialEmit(ctx, _content, _resources, changeEvents) {
      const excludeExtensions = getPageTypeExtensions(ctx)
      for (const changeEvent of changeEvents) {
        const ext = path.extname(changeEvent.path)
        if (ext === ".md" || excludeExtensions.has(ext)) continue

        if (changeEvent.type === "add" || changeEvent.type === "change") {
          yield copyFile(ctx.argv, changeEvent.path)
        } else if (changeEvent.type === "delete") {
          // Match copyFile's .toLowerCase() above, or a deleted asset's stale output file
          // (copied under the lowercase name) would never actually get cleaned up here.
          const name = slugifyFilePath(changeEvent.path).toLowerCase()
          const dest = joinSegments(ctx.argv.output, name) as FilePath
          await fs.promises.unlink(dest)
        }
      }
    },
  }
}
