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
- Debian trixie slim based; CI always builds with the newest stable Go,
  golangci-lint and Prettier releases; the `ARG` defaults in the
  `Dockerfile` only apply to local builds
- A daily CI build at 03:00 UTC (also manually triggerable) discovers the
  newest stable Go, golangci-lint and Prettier releases and publishes an
  image for a new Go version; a tool-only update refreshes the floating
  `latest`, major and minor tags while full-version tags stay frozen.
  Untagged leftover image versions are deleted automatically by the
  workflow

## License

[MIT](LICENSE)
