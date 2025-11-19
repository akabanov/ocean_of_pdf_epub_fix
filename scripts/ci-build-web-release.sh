#!/usr/bin/env bash

cd "$(dirname "$0")/.."

set -euo pipefail

# Pin Flutter version; override by setting FLUTTER_VERSION in Vercel env if needed
FLUTTER_VERSION="${FLUTTER_VERSION:-3.35.3}"

# Install Flutter (cached across builds in $HOME on Vercel)
if [ ! -d "$HOME/flutter" ]; then
  git clone --depth 1 -b "$FLUTTER_VERSION" https://github.com/flutter/flutter.git "$HOME/flutter"
fi
export PATH="$HOME/flutter/bin:$PATH"

flutter --version
flutter config --enable-web
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# Optional: inject env vars as dart-defines
# Example: add API_BASE_URL in Vercel Project Settings → Environment Variables
DEFINE_ARGS=()
#[ -n "${API_BASE_URL:-}" ] && DEFINE_ARGS+=(--dart-define="API_BASE_URL=${API_BASE_URL}")

# Build
flutter build web --release --wasm "${DEFINE_ARGS[@]}"

FONT_MANIFEST="build/web/assets/FontManifest.json"
RAND="$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 6 || true)"
sed -i'' -e "s#MaterialIcons-Regular.otf\"#MaterialIcons-Regular.otf?v=${RAND}\"#g" "$FONT_MANIFEST"
sed -i'' -e "s#.ttf\"#.ttf?v=${RAND}\"#g" "$FONT_MANIFEST"
