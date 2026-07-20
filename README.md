# atomic-documentation-codesandbox

A static HTML template showcasing [Coveo Atomic](https://docs.coveo.com/en/atomic/latest/) search interface components. This repo serves as the base CodeSandbox demo embedded in Coveo's documentation — each branch corresponds to a specific Atomic library version.

## Purpose

- Provide a live, runnable example of Coveo Atomic for documentation pages
- Automatically generate versioned branches when new Atomic releases are published (via `repository_dispatch`)
- Serve as the CodeSandbox template linked from [docs.coveo.com](https://docs.coveo.com)

## Project Structure

```
.
├── index.html                 # Main demo page with Atomic components
├── package.json               # Static server config (serve)
├── sandbox.config.json        # CodeSandbox template config
├── catalog-info.yaml          # Backstage service catalog entry
├── renovate.json5             # Renovate dependency update config
├── CODEOWNERS                 # Ownership: @coveo/dev-writers
└── .github/
    ├── scripts/
    │   └── update_package.rb  # Ruby script to update CDN URLs per version
    └── workflows/
        ├── createNewAtomicSandBoxDemo.yml  # Creates versioned branch on new Atomic release
        └── dependency-review.yml           # Dependency review on PRs
```

## How It Works

1. The Coveo Atomic library publishes a new release.
2. A `repository_dispatch` event (`atomic_docs_generated`) triggers the `createNewAtomicSandBoxDemo` workflow.
3. The workflow runs `update_package.rb` which updates the CDN script/stylesheet URLs in `index.html` to point to the new version.
4. A new branch named after the version is pushed (e.g., `v2.35`).
5. Documentation pages embed the CodeSandbox for the relevant branch.

## Local Development

```bash
# Install dependencies
npm install

# Start a local static server
npm start
```

Then open `http://localhost:3000` in your browser.

There is no build step — this is a static HTML template served as-is.

## Requirements

- Node.js (for `serve` dev dependency)
- Ruby 4.0+ with `nokogiri` gem (only needed for the CI version-update script)

## Ownership

Maintained by **@coveo/dev-writers** (see `CODEOWNERS`).

## License

MIT
