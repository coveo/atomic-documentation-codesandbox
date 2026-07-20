# Copilot Instructions

## Context

This repo is a static HTML CodeSandbox demo for Coveo Atomic documentation. There is no build system, no framework, and no test suite.

## Rules for Code Review

- The `index.html` must remain self-contained (inline scripts and styles). Do not suggest extracting to separate files.
- The `accessToken` in `index.html` is a public demo token — do not flag it as a leaked secret.
- CDN URLs (`static.cloud.coveo.com/atomic/v3/`) should not be changed manually. Version updates are managed by the CI workflow.
- There is no build step. `npm run build` is intentionally a no-op.
- Do not suggest adding a test suite, bundler, or framework.
- Ensure all Atomic components use valid attributes per the [Atomic docs](https://docs.coveo.com/en/atomic/latest/).
- CSS custom properties should use the `--atomic-` prefix when overriding Atomic theme variables.
- Result templates must be wrapped in `<atomic-result-template><template>...</template></atomic-result-template>`.
- Keep the demo accessible: maintain `lang` attribute on `<html>`, use semantic Atomic layout sections.
