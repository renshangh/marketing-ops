#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/multimedia/graphics/red-lobster-3d-source.jpg"
OUT="$ROOT/multimedia/clips/red-lobster-3d-final.mp4"

mkdir -p "$ROOT/multimedia/graphics" "$ROOT/multimedia/clips"

if [[ ! -f "$SRC" ]]; then
  echo "Missing source: $SRC" >&2
  exit 1
fi

ffmpeg -y -loop 1 -i "$SRC" -t 6 \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,zoompan=z='min(zoom+0.00055,1.10)':x='iw/2-(iw/zoom)/2+18*sin(2*PI*on/90)':y='ih/2-(ih/zoom)/2-18+26*sin(2*PI*on/60)':d=180:s=1080x1920:fps=30,rotate='0.012*sin(2*PI*t/6)',eq=contrast=1.08:saturation=1.14:brightness=0.015:gamma=1.0,colorbalance=rs=0.05:gs=0.02:bs=-0.03,vignette=angle=PI/8,fade=t=in:st=0:d=0.25,fade=t=out:st=5.75:d=0.25,format=yuv420p" \
  -r 30 "$OUT"

ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT"
