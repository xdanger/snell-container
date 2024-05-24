#!/bin/bash

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Usage: build.sh VERSION"
    exit 1
fi

docker buildx build \
  --push \
  --platform linux/aarch64 \
  --build-arg VERSION=${VERSION} \
  --build-arg ARCH=arm64 \
  --tag ghcr.io/xdanger/snell-container:$VERSION \
  .
