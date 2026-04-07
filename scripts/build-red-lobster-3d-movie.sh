#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC_SVG="$ROOT/multimedia/graphics/red-lobster-3d-source.svg"
SRC_PNG="$ROOT/multimedia/graphics/red-lobster-3d-source.png"
OUT="$ROOT/multimedia/clips/red-lobster-3d-final.mp4"

mkdir -p "$ROOT/multimedia/graphics" "$ROOT/multimedia/clips"

if [[ ! -f "$SRC_SVG" ]]; then
  echo "Missing source: $SRC_SVG" >&2
  exit 1
fi

if ! command -v rsvg-convert >/dev/null 2>&1; then
  echo "Missing rsvg-convert" >&2
  exit 1
fi

rsvg-convert -w 1080 -h 1920 "$SRC_SVG" -o "$SRC_PNG"

ffmpeg -y -loop 1 -i "$SRC_PNG" -t 6 \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,zoompan=z='min(zoom+0.00048,1.08)':x='iw/2-(iw/zoom)/2+14*sin(2*PI*on/75)':y='ih/2-(ih/zoom)/2-10+22*sin(2*PI*on/58)':d=180:s=1080x1920:fps=30,rotate='0.010*sin(2*PI*t/6)',eq=contrast=1.08:saturation=1.16:brightness=0.015:gamma=1.0,colorbalance=rs=0.05:gs=0.02:bs=-0.03,vignette=angle=PI/8,fade=t=in:st=0:d=0.25,fade=t=out:st=5.75:d=0.25,format=yuv420p" \
  -r 30 "$OUT"

ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT"
