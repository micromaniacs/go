# Contributing

## Branching

- Never push to `master`.
- Branch from `master`: `git checkout -b feat/<topic>`.
- Commit messages: no conventional prefixes (`feat:`, `fix:`, …), past tense —
  e.g. `Added golangci-lint to the image`, `Fixed the smoke test`.

## Development

- Tool versions track the latest available releases. The image follows the
  Go 1 series; CI derives the major, minor and full version tags from the Go
  version in the base image.
- Format changed Markdown and YAML files with Prettier:

  ```sh
  npx prettier --write README.md CONTRIBUTING.md .github/
  ```

- Build and test locally before pushing:

  ```sh
  docker build -t ghcr.io/micromaniacs/go:local .
  docker run --rm ghcr.io/micromaniacs/go:local sh -c 'go version && golangci-lint version && buf --version && protoc --version && make --version && gcc --version && node --version && npm --version && npx --version && prettier --version && git --version'
  ```

- CI rebuilds and pushes the image to GHCR daily at 03:00 UTC (also manually
  triggerable); no releases, tags are `latest` plus the Go version:
  `1`, `1.27`, `1.27.3`.
