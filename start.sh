#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
pnpm exec eleventy --serve --port=8182
