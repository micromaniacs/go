FROM docker.io/library/node:trixie-slim AS node

FROM docker.io/library/golang:1-trixie AS go

FROM docker.io/golangci/golangci-lint:latest AS golangci

FROM docker.io/library/debian:trixie-slim

ENV GOPATH=/go \
    GOTOOLCHAIN=local \
    PATH=/usr/local/go/bin:/go/bin:$PATH

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      gcc \
      git \
      libc6-dev \
      make \
      protobuf-compiler \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /go/bin /go/src \
 && chmod -R 1777 /go

COPY --from=go /usr/local/go /usr/local/go
COPY --from=golangci /usr/bin/golangci-lint /usr/local/bin/golangci-lint
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules

RUN ln -sf ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
 && ln -sf ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx \
 && npm install -g --allow-scripts=@bufbuild/buf prettier @bufbuild/buf \
 && rm -rf /root/.npm

LABEL org.opencontainers.image.title="go" \
      org.opencontainers.image.source="https://github.com/micromaniacs/go" \
      org.opencontainers.image.description="Docker image for building Go applications in Forgejo/Gitea Actions with golangci-lint, Node.js and Prettier" \
      org.opencontainers.image.licenses="MIT"

WORKDIR /tmp
