# dsn2027-berlin.github.io

Website source for DSN 2027 Berlin.

## Development

This site uses Eleventy and publishes static HTML.

```sh
pnpm install
pnpm run start
```

Or use the convenience script:

```sh
./start.sh
```

Build the production output with:

```sh
pnpm run build
```

The generated site is written to `_site/`.

## Content

Public-facing site data lives in `src/_data/conference.js`.

For maintenance instructions, see `MAINTAINING.md`.

## Deployment

The included GitHub Actions workflow builds the site and deploys `_site/` to
GitHub Pages on pushes to `main`.
