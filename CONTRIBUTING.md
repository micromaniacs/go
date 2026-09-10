# Contributing

## Branching

- Never push to `master`.
- Branch from `master`: `git checkout -b feat/<topic>`.
- Commit messages: no conventional prefixes (`feat:`, `fix:`, …), past tense —
  e.g. `Added golangci-lint to the image`, `Fixed the smoke test`.

## Development

- Tool versions: Go and golangci-lint are pinned via `ARG GO_VERSION` and
  `ARG GOLANGCI_LINT_VERSION` in the `Dockerfile` — bump them there
  (`GO_VERSION` also moves the version tags); everything else (Debian, node,
  prettier) tracks the latest available versions.
- Format changed Markdown and YAML files with Prettier:

  ```sh
  npx prettier --write README.md CONTRIBUTING.md .github/
  ```

- Build and test locally before pushing:

  ```sh
  docker build -t ghcr.io/micromaniacs/go:local .
  docker run --rm ghcr.io/micromaniacs/go:local sh -c 'go version && golangci-lint version && make --version && gcc --version && node --version && npm --version && npx --version && prettier --version && git --version'
  ```

- CI rebuilds and pushes the image to GHCR daily at 03:00 UTC (also manually
  triggerable); no releases, tags follow the pinned Go version:
  `latest`, `1`, `1.27`, `1.27.1`.
