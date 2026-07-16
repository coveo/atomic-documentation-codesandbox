# Contributing

## Overview

This repo holds the CodeSandbox template used in Coveo Atomic documentation. Contributions are typically limited to updating the demo content or fixing issues with the template.

## Getting Started

```bash
git clone https://github.com/coveo/atomic-documentation-codesandbox.git
cd atomic-documentation-codesandbox
npm install
npm start
```

Open `http://localhost:3000` to see the demo.

## Making Changes

1. Edit `index.html` directly — all demo code lives there.
2. Verify changes locally by running `npm start` and checking the browser.
3. Open a PR against `master`.

## What Belongs Here

- Coveo Atomic component examples for documentation
- CSS customization examples using `--atomic-*` variables
- Result template examples

## What Does NOT Belong Here

- Build tooling, bundlers, or frameworks
- Separate JS/CSS files (CodeSandbox needs a self-contained `index.html`)
- Real API keys or private access tokens
- Direct edits to versioned branches (those are CI-managed)

## Branching Strategy

- `master` — the latest demo version
- Version branches (e.g., `v2.35`) — created automatically by CI when a new Atomic release is published. Do not edit these directly.

## PR Expectations

- Describe what you changed and why
- Confirm you tested locally with `npm start`
- Keep changes focused — one logical change per PR

## Working with AI Agents

When using an AI coding agent on this repo:

1. Point the agent to `AGENTS.md` for project context.
2. Ask it to edit `index.html` for demo changes.
3. Validate locally with `npm start` before submitting.
4. The agent should not attempt to add build tools, test suites, or extract files.

## Ownership

This repo is owned by **@coveo/dev-writers**. Reach out in the team's channel for questions.
