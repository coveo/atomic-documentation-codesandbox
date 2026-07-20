# AGENTS.md

## Project Overview

This is a static HTML demo of [Coveo Atomic](https://docs.coveo.com/en/atomic/latest/) search components, used as the embedded CodeSandbox in Coveo documentation. There is no bundler, no framework, and no test suite — just a single `index.html` served statically.

## Tech Stack

- **HTML** — single-page static template
- **Coveo Atomic v3** — loaded via CDN (`static.cloud.coveo.com`)
- **Node.js + `serve`** — local development server (dev dependency only)
- **Ruby + Nokogiri** — CI script for updating CDN URLs on new Atomic releases

## Commands

| Task | Command | Notes |
|------|---------|-------|
| Install dependencies | `npm install` | Only installs `serve` |
| Start local server | `npm start` | Serves static files on port 3000 |
| Build | `npm run build` | No-op (static template, no bundler) |

## Project Structure

- `index.html` — The entire demo. Contains Atomic web components, initialization script, CSS customization examples, and result templates.
- `package.json` — Minimal config for the static server and metadata.
- `sandbox.config.json` — Tells CodeSandbox this is a static template.
- `.github/scripts/update_package.rb` — Ruby script that updates CDN URLs and package name for a given Atomic version.
- `.github/workflows/createNewAtomicSandBoxDemo.yml` — Triggered by `repository_dispatch` to create a versioned branch.
- `.github/workflows/dependency-review.yml` — Runs dependency review on PRs to `master` and version branches.

## Conventions

- **Branching:** Each branch corresponds to an Atomic library version (e.g., `v2.35`). The `master` branch tracks the latest.
- **No tests:** This is a documentation example, not a library. There is no test suite.
- **No build artifacts:** Everything is served as plain HTML. The `build` script is intentionally a no-op.
- **CDN references:** Atomic JS and CSS are loaded from `https://static.cloud.coveo.com/atomic/v3/`. Version updates are handled by the CI workflow, not manually.
- **Access token in code:** The `accessToken` in `index.html` is a public demo token for the `searchuisamples` org — this is intentional and not a secret.

## Making Changes

- **Updating the demo content:** Edit `index.html` directly. Add/remove Atomic components, change facets, modify result templates.
- **Updating CSS:** Custom styles are inline in `<style>` blocks within `index.html`.
- **Changing the Atomic version:** Don't edit CDN URLs manually. The CI workflow handles this via `repository_dispatch`.

## What NOT to Do

- Do not add a bundler or build system.
- Do not move inline scripts/styles to separate files (CodeSandbox expects a self-contained `index.html`).
- Do not commit real API keys or non-public access tokens.
- Do not modify versioned branches directly — they are managed by CI.
