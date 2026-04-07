#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SVG="$ROOT/multimedia/graphics/red-lobster-3d-source.svg"
OUT="$ROOT/multimedia/clips/red-lobster-3d-final.mp4"
CHANT_AIFF="$ROOT/multimedia/clips/red-lobster-chant.aiff"
CHANT_MP3="$ROOT/multimedia/clips/red-lobster-chant.mp3"
FRAMES_DIR="$ROOT/multimedia/clips/_red-lobster-frames"
HTML_OUT="$ROOT/multimedia/clips/_red-lobster-action.html"
PYTHON="$ROOT/.venv-lobster3d/bin/python"

mkdir -p "$ROOT/multimedia/graphics" "$ROOT/multimedia/clips"
rm -rf "$FRAMES_DIR"
mkdir -p "$FRAMES_DIR"

if [[ ! -f "$SVG" ]]; then
  echo "Missing source: $SVG" >&2
  exit 1
fi

if [[ ! -x "$PYTHON" ]]; then
  echo "Missing venv python: $PYTHON" >&2
  exit 1
fi

"$PYTHON" "$ROOT/scripts/render-red-lobster-3d-action.py" \
  --svg "$SVG" \
  --html "$HTML_OUT" \
  --frames "$FRAMES_DIR" \
  --fps 30 \
  --duration 6.0

say -v Fred -r 182 -o "$CHANT_AIFF" \
  "welcome to linkgear, welcome to linkgear, welcome to linkgear, welcome to linkgear, welcome to linkgear"

ffmpeg -y -i "$CHANT_AIFF" \
  -af "aecho=0.8:0.88:60:0.18,atempo=1.00" \
  -codec:a libmp3lame -q:a 2 "$CHANT_MP3"

ffmpeg -y \
  -framerate 30 \
  -i "$FRAMES_DIR/frame%04d.png" \
  -i "$CHANT_MP3" \
  -shortest \
  -c:v libx264 \
  -pix_fmt yuv420p \
  -c:a aac \
  -b:a 192k \
  "$OUT"

ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT"
