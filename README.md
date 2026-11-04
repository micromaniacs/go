# go

Docker image for building Go applications in Forgejo/Gitea Actions CI.

Bundled tools:

- go (latest release in the Go 1 series)
- golangci-lint (latest release)
- `buf` (latest release)
- `protoc` (installed from Debian's `protobuf-compiler` package)
- gcc + libc6-dev (cgo)
- make
- git
- node (npm, npx included)
- prettier

## Image

Published to GHCR as `ghcr.io/micromaniacs/go`:

- Tags: `latest`, major (e.g. `1`), major.minor (e.g. `1.27`) and the full
  version (e.g. `1.27.3`)
- Multi-arch: `linux/amd64` and `linux/arm64`
- Debian trixie slim based; each daily build uses the latest Go 1 release and
  latest available versions of the other tools
- Rebuilt daily at 03:00 UTC via CI (also manually triggerable)

## License

[MIT](LICENSE)
