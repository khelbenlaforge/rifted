import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "Aenath — Rifted Campaign Wiki",
    pageTitleSuffix: " | Rifted",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "none",
    },
    locale: "en-US",
    baseUrl: "khelbenlaforge.github.io/rifted",
    ignorePatterns: ["private", "templates", ".obsidian"],
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Cinzel",
        body: "Literata",
        code: "Fira Code",
      },
      colors: {
        lightMode: {
          light: "#faf7f0",
          lightgray: "#e8e0d0",
          gray: "#8c7b6e",
          darkgray: "#3d2b1f",
          dark: "#1a0a00",
          secondary: "#922610",
          tertiary: "#c5860a",
          highlight: "rgba(197, 134, 10, 0.15)",
          textHighlight: "rgba(197, 134, 10, 0.4)",
        },
        darkMode: {
          light: "#1a1e24",
          lightgray: "#252c36",
          gray: "#4e5b6f",
          darkgray: "#d4c5b0",
          dark: "#f0e6d3",
          secondary: "#c94d4d",
          tertiary: "#61afef",
          highlight: "rgba(168, 60, 60, 0.15)",
          textHighlight: "#7a141466",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "git", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "solarized-light",
          dark: "one-dark-pro",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      // Plugin.Latex({ renderEngine: "katex" }), // not needed for campaign wiki
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.Favicon(),
      Plugin.NotFoundPage(),
      // CustomOgImages disabled — slow to build, not needed for campaign wiki
      // Plugin.CustomOgImages(),
    ],
  },
}

export default config
