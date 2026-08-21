# Repository Guidelines

## Project Structure & Module Organization

This is an Eleventy static site for DSN 2027 Berlin. Edit source files only
under `src/`; `_site/` is regenerated output and must never be edited or
committed. Use Markdown (`src/*.md`) for prose pages, Nunjucks (`src/*.njk`)
for pages that render structured data, and `src/_includes/` for shared page
layouts. Keep reusable data in `src/_data/`, navigation in
`src/_data/navigation.js`, and public images and styles in `src/assets/`.

## Build, Test, and Development Commands

- `pnpm install` installs the pinned development dependencies.
- `pnpm run start` cleans the output and serves a local preview on port 8080.
- `pnpm run build` recreates the production site in `_site/`.
- `git diff --check` detects whitespace errors before committing.
- `markdownlint-cli2 AGENTS.md` checks this guide's Markdown when that tool is
  available.

There is no automated test suite. Treat a successful production build and
inspection of the affected generated page under `_site/` as the required
validation for site changes.

## Coding Style & Naming Conventions

Follow the existing JavaScript style: two-space indentation, double-quoted
strings, trailing commas in multiline objects, and small focused data changes.
Use lowercase, hyphenated filenames for pages and assets, for example
`src/visas-and-invitation.md` and `src/assets/committees/name.jpg`. Preserve
UTF-8 text and accents in committee data. Use local asset paths such as
`/assets/committees/name.jpg`, not generated `_site/` paths.

## Content and Asset Changes

Update shared navigation in `src/_data/navigation.js` when adding or renaming
pages. Use `src/_includes/base.njk` only for site-wide chrome. Record sources
and licenses for new public visual assets in `MAINTAINING.md`. Keep committee
role order aligned with the planning data and do not replace unrequested
content. Do not modify templates without explicit requests.
