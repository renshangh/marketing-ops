#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/multimedia/graphics/red-lobster-3d-source.jpg"
OUT="$ROOT/multimedia/clips/red-lobster-3d-final.mp4"
URL="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Nur01521_-_Flickr_-_NOAA_Photo_Library.jpg/1280px-Nur01521_-_Flickr_-_NOAA_Photo_Library.jpg"

mkdir -p "$ROOT/multimedia/graphics" "$ROOT/multimedia/clips"

if [[ ! -f "$SRC" ]]; then
  curl -L "$URL" -o "$SRC"
fi

ffmpeg -y -loop 1 -i "$SRC" -t 6 \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,zoompan=z='min(zoom+0.00025,1.04)':d=180:s=1080x1920:fps=30,eq=contrast=1.08:saturation=1.14:brightness=0.02:gamma=1.0,colorbalance=rs=0.10:gs=0.02:bs=-0.08,vignette=angle=PI/7,fade=t=in:st=0:d=0.25,fade=t=out:st=5.75:d=0.25,format=yuv420p" \
  -r 30 "$OUT"

ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT"
