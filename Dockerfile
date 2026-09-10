ARG GO_VERSION=1.27.1
ARG NODE_IMAGE=docker.io/library/node:trixie-slim

FROM ${NODE_IMAGE} AS node

FROM docker.io/library/golang:${GO_VERSION}-trixie AS go

FROM docker.io/library/debian:trixie-slim

ARG GOLANGCI_LINT_VERSION=v2.13.2

ENV GOPATH=/go \
    GOTOOLCHAIN=local \
    PATH=/usr/local/go/bin:/go/bin:$PATH

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      gcc \
      git \
      libc6-dev \
      make \
 && rm -rf /var/lib/apt/lists/* \
 && curl -fsSL --retry 3 "https://raw.githubusercontent.com/golangci/golangci-lint/${GOLANGCI_LINT_VERSION}/install.sh" | sh -s -- -b /usr/local/bin "${GOLANGCI_LINT_VERSION}" \
 && mkdir -p /go/bin /go/src \
 && chmod -R 1777 /go

COPY --from=go /usr/local/go /usr/local/go
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules

RUN ln -sf ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
 && ln -sf ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx \
 && npm install -g prettier \
 && rm -rf /root/.npm

LABEL org.opencontainers.image.title="go" \
      org.opencontainers.image.source="https://github.com/micromaniacs/go" \
      org.opencontainers.image.description="Docker image for building Go applications in Forgejo/Gitea Actions with golangci-lint, Node.js and Prettier" \
      org.opencontainers.image.licenses="MIT"

WORKDIR /tmp
