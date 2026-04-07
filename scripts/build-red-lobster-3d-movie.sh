#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/multimedia/graphics/red-lobster-3d-source.jpg"
OUT="$ROOT/multimedia/clips/red-lobster-3d-final.mp4"
URL="https://media.sketchfab.com/models/9e3cb833f9b942a2a8a7183a469be637/thumbnails/0a6afe2332d943aea1efa58683f6f111/7d29ee4e4bcd48f8a3d7e6d6fdc63971.jpeg"

mkdir -p "$ROOT/multimedia/graphics" "$ROOT/multimedia/clips"

if [[ ! -f "$SRC" ]]; then
  curl -L "$URL" -o "$SRC"
fi

ffmpeg -y -loop 1 -i "$SRC" -t 6 \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,zoompan=z='min(zoom+0.00035,1.045)':d=180:s=1080x1920:fps=30,eq=contrast=1.08:saturation=1.15:brightness=0.01:gamma=1.0,colorbalance=rs=0.06:gs=0.01:bs=-0.04,vignette=angle=PI/8,fade=t=in:st=0:d=0.25,fade=t=out:st=5.75:d=0.25,format=yuv420p" \
  -r 30 "$OUT"

ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT"
