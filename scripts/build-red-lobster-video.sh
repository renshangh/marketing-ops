#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/multimedia/graphics/red-lobster.png"
OUT="$ROOT/multimedia/clips/red-lobster-final.mp4"
DRY_RUN="${DRY_RUN:-0}"

cmd() {
  if [[ "$DRY_RUN" == "1" ]]; then
    printf '+ %q ' "$@"
    printf '\n'
  else
    "$@"
  fi
}

[[ -f "$SRC" ]] || { echo "Missing source image: $SRC" >&2; exit 1; }

if [[ "$DRY_RUN" == "1" ]]; then
  echo "DRY RUN: would build a 12s vertical lobster video from $SRC -> $OUT"
fi

cmd ffmpeg -y -loop 1 -i "$SRC" -t 12 -vf "scale=1080:1920,zoompan=z='min(zoom+0.00035,1.06)':d=360:s=1080x1920:fps=30,format=yuv420p" -r 30 "$OUT"
cmd ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT"
