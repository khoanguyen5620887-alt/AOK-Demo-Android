#!/bin/sh
set -eu

GRADLE_VERSION="8.7"
CACHE_DIR="${GRADLE_USER_HOME:-$HOME/.gradle}/aok-bootstrap"
DIST="$CACHE_DIR/gradle-$GRADLE_VERSION"
ZIP="$CACHE_DIR/gradle-$GRADLE_VERSION-bin.zip"

if [ ! -x "$DIST/bin/gradle" ]; then
  mkdir -p "$CACHE_DIR"
  if [ ! -f "$ZIP" ]; then
    curl -fsSL -o "$ZIP" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
  fi
  rm -rf "$DIST.tmp"
  mkdir -p "$DIST.tmp"
  unzip -q "$ZIP" -d "$DIST.tmp"
  mv "$DIST.tmp/gradle-$GRADLE_VERSION" "$DIST"
  rm -rf "$DIST.tmp"
fi

exec "$DIST/bin/gradle" "$@"
