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
  version (e.g. `1.27.1`); all track the newest build. Every build is also
  published under a unique tag combining the exact Go, golangci-lint and
  Prettier versions (e.g. `1.27.1-lintv2.14.0-prettier3.9.10`), which is
  never re-pointed and keeps older builds available
- Multi-arch: `linux/amd64` and `linux/arm64`
- Debian trixie slim based; CI always builds with the newest stable Go,
  golangci-lint and Prettier releases; the `ARG` defaults in the
  `Dockerfile` only apply to local builds
- A daily CI build at 03:00 UTC (also manually triggerable) discovers the
  newest stable Go, golangci-lint and Prettier releases and publishes a
  new image whenever that exact combination has not been published yet.
  Untagged leftover image versions are deleted automatically by the
  workflow

## License

[MIT](LICENSE)
