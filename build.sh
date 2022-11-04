#!/bin/bash

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Usage: build.sh VERSION"
    exit 1
fi

docker buildx build \
  --push \
  --platform linux/amd64 \
  --build-arg VERSION=${VERSION} \
  --tag geekdada/snell-server:$VERSION \
  .
