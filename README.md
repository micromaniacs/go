# go

Docker image for building Go applications in Forgejo/Gitea Actions CI.

Bundled tools:

- go (pinned via `ARG` in the `Dockerfile`)
- golangci-lint (pinned via `ARG` in the `Dockerfile`)
- gcc + libc6-dev (cgo)
- make
- git
- node (npm, npx included)
- prettier

## Image

Published to GHCR as `ghcr.io/micromaniacs/go`:

- Tags: `latest`, major (e.g. `1`), major.minor (e.g. `1.27`) and the full
  version (e.g. `1.27.1`)
- Multi-arch: `linux/amd64` and `linux/arm64`
- Debian trixie slim based; Go and golangci-lint versions are pinned via
  `ARG GO_VERSION` / `ARG GOLANGCI_LINT_VERSION` in the `Dockerfile` (bump
  them there), everything else tracks the latest available versions
- Rebuilt daily at 03:00 UTC via CI (also manually triggerable)

## License

[MIT](LICENSE)
