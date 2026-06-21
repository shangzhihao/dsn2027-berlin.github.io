# Maintaining the DSN 2027 Website

This repository contains the source for the DSN 2027 Berlin website. The site is
built with Eleventy and deployed as static HTML through GitHub Pages.

## Quick Start

Install dependencies:

```sh
pnpm install
```

Run the local preview server:

```sh
pnpm run start
```

Open:

```text
http://localhost:8080/
```

Build the production site:

```sh
pnpm run build
```

## Important Rule

Edit files under `src/`. Do not edit `_site/`.

`_site/` is generated output. The build script removes and regenerates it, so
manual edits there will be lost.

## Page Files

Each top-level page has one source file:

- Home: `src/index.njk`, URL `/`
- Call for Contributions: `src/call-for-contributions.njk`,
  URL `/call-for-contributions/`
- Workshops: `src/workshops.njk`, URL `/workshops/`
- Committees: `src/committees.njk`, URL `/committees/`
- Conference Program: `src/conference-program.njk`,
  URL `/conference-program/`
- Sponsors: `src/sponsors.njk`, URL `/sponsors/`
- Previous DSN Conferences: `src/previous-conferences.njk`,
  URL `/previous-conferences/`

## Shared Layout

The shared page shell, sidebar navigation, footer, favicon links, and global
asset links live in:

```text
src/_includes/base.njk
```

Update this file when adding, removing, or renaming top-level pages.

## Shared Data

Structured content lives in:

```text
src/_data/conference.js
```

Use this file for content that appears in a loop or may be reused, such as:

- committee roles and names
- previous DSN conference links
- conference title, subtitle, location, and dates

The Committees page renders `conference.roles` in order. Keep that order aligned
with the DSN 2027 planning document.

## Assets

Images and CSS live in:

```text
src/assets/
```

Current important assets:

- `logo.png`: main DSN 2027 logo
- `favicon.png`: 512 by 512 favicon
- `favicon-32.png`: 32 by 32 favicon
- `apple-touch-icon.png`: Apple touch icon
- `berlin-brandenburg-gate.jpg`: homepage hero image
- `styles.css`: site styles

Editable design sources live outside `src/` so they are versioned but not
published with the generated site:

- `design/logo.kra`: Krita source file for `src/assets/logo.png`

If replacing the logo, also regenerate the favicon files from the new logo.

## Previous Conferences

The Previous DSN Conferences page is generated from
`conference.previousConferences` in `src/_data/conference.js`.

The initial list was copied from the DSN 2026 `prevconf.html` page and extended
with DSN 2026.

## Deployment

The GitHub Actions workflow is:

```text
.github/workflows/deploy.yml
```

It builds `_site/` and deploys it to GitHub Pages.

The target repository must have GitHub Pages configured to use **GitHub
Actions**, not legacy branch deployment. Legacy deployment will serve the source
README instead of the Eleventy output.

## Validation Checklist

Before committing website changes, run:

```sh
pnpm run build
git diff --check
```

For Markdown-only changes, also run:

```sh
markdownlint-cli2 README.md MAINTAINING.md
```

Check the generated route list when adding or removing pages:

```sh
find _site -maxdepth 3 -type f | sort
```

## Git Workflow

Typical workflow:

1. Edit files locally.
2. Run validation.
3. Commit focused changes.
4. Push to the fork.
5. Open a pull request into `dsn2027-berlin/dsn2027-berlin.github.io`.

Do not commit generated `_site/`, `node_modules/`, or local design source files
unless they are intentionally part of the public website source.

## Notes for AI Agents

- Re-read files from disk before editing.
- Keep changes scoped to the requested site behavior.
- Preserve existing content unless the user asks to remove or rewrite it.
- Do not edit or rely on `_site/` as source.
- Keep editable design sources under `design/`, not `src/assets/`, unless they
  should be publicly served by the website.
- After page structure changes, verify that deleted routes are absent from
  `_site/`.
