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
  version (e.g. `1.27.1`). Full-version tags are immutable: each is built
  and pushed exactly once and never re-pointed; `latest`, major and minor
  track the newest matching version
- Multi-arch: `linux/amd64` and `linux/arm64`
- Debian trixie slim based; the golangci-lint version is pinned via
  `ARG GOLANGCI_LINT_VERSION` in the `Dockerfile` (bump it there);
  `ARG GO_VERSION` only pins the local build default
- A daily CI build at 03:00 UTC (also manually triggerable) discovers the
  newest stable Go release and publishes it once if its full-version tag
  is not published yet. Untagged leftover image versions are deleted
  automatically by the workflow

## License

[MIT](LICENSE)
