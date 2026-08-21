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
- Call for Contributions: `src/call-for-contributions.md`,
  URL `/call-for-contributions/`
- Workshops: `src/workshops.md`, URL `/workshops/`
- Venue: `src/venue.md`, URL `/attend/venue/`
- Accommodation: `src/accommodation.md`, URL `/attend/accommodation/`
- Local Attractions: `src/local-attractions.md`,
  URL `/attend/local-attractions/`
- Visas and Invitation: `src/visas-and-invitation.md`,
  URL `/attend/visas-and-invitation/`
- Mentoring: `src/mentoring.md`, URL `/mentoring/`
- Awards Information: `src/awards.md`, URL `/awards/`
- Carter Award: `src/carter-award.md`, URL `/awards/carter-award/`
- Rising Star Award: `src/rising-star-award.md`,
  URL `/awards/rising-star-award/`
- Test of Time Award: `src/test-of-time-award.md`,
  URL `/awards/test-of-time-award/`
- Distinguished Artifact Award: `src/distinguished-artifact-award.md`,
  URL `/awards/distinguished-artifact-award/`
- Jean-Claude Laprie Award: `src/jean-claude-laprie-award.md`,
  URL `/awards/jean-claude-laprie-award/`
- Organizing Committee: `src/committees.njk`, URL `/committees/`
- Research Track Program Committee:
  `src/research-track-program-committee.njk`,
  URL `/committees/research-track-program-committee/`
- Steering Committee: `src/steering-committee-chairs.njk`,
  URL `/committees/steering-committee-chairs/`
- Conference Program: `src/conference-program.md`,
  URL `/conference-program/`
- Sponsors: `src/sponsors.md`, URL `/sponsors/`
- Previous DSN Conferences: `src/previous-conferences.njk`,
  URL `/previous-conferences/`

Pages with mostly prose content use Markdown (`.md`). Pages driven by
Nunjucks loops over data (committees, previous conferences) use `.njk`.

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

- organizing committee roles and names
- research track program committee members
- steering committee chairs
- steering committee members and charter
- previous DSN conference links
- conference title, subtitle, location, and dates

The Organizing Committee page renders `conference.roles` in order. Keep that
order aligned with the DSN 2027 planning document. The Research Track Program
Committee page renders `conference.researchTrackProgramCommittee`, initially
generated from `HotCRP.xlsx` and maintained in its data file; keep that file
UTF-8 because it contains accented names and affiliations. The Steering
Committee page renders `conference.steeringCommitteeChairs`,
`conference.steeringCommittee`, and `conference.steeringCommitteeCharter`.

## Assets

Images and CSS live in:

```text
src/assets/
```

Current important assets:

- `logo.png`: main DSN 2027 logo
- `favicon.png`: 512 by 512 favicon
- `apple-touch-icon.png`: Apple touch icon
- `berlin-brandenburg-gate.jpg`: homepage hero image
- `tagungswerk-hall.webp`: venue page image
- `attractions/`: optimized attraction thumbnails with source and license
  credits on the Local Attractions page
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
