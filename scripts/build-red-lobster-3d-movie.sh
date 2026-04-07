#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SVG="$ROOT/multimedia/graphics/red-lobster-3d-source.svg"
BASE="$ROOT/multimedia/clips/_red-lobster-base.png"
CHANT_AIFF="$ROOT/multimedia/clips/red-lobster-chant.aiff"
CHANT_MP3="$ROOT/multimedia/clips/red-lobster-chant.mp3"
OUT="$ROOT/multimedia/clips/red-lobster-3d-final.mp4"

mkdir -p "$ROOT/multimedia/graphics" "$ROOT/multimedia/clips"

if [[ ! -f "$SVG" ]]; then
  echo "Missing source: $SVG" >&2
  exit 1
fi

if ! command -v rsvg-convert >/dev/null 2>&1; then
  echo "Missing rsvg-convert" >&2
  exit 1
fi

rsvg-convert -w 1080 -h 1920 "$SVG" -o "$BASE"

ffmpeg -y -loop 1 -i "$BASE" -t 6 \
  -vf "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,zoompan=z='min(zoom+0.00010,1.018)':x='iw/2-(iw/zoom)/2+3*sin(2*PI*on/120)':y='ih/2-(ih/zoom)/2+2*sin(2*PI*on/95)':d=180:s=1080x1920:fps=30,eq=contrast=1.06:saturation=1.10:brightness=0.01,rotate='0.003*sin(2*PI*t/6)',vignette=angle=PI/9,fade=t=in:st=0:d=0.25,fade=t=out:st=5.75:d=0.25,format=yuv420p" \
  -r 30 "$OUT"

say -v Fred -r 182 -o "$CHANT_AIFF" \
  "welcome to linkgear, welcome to linkgear, welcome to linkgear, welcome to linkgear, welcome to linkgear"

ffmpeg -y -i "$CHANT_AIFF" \
  -codec:a libmp3lame -q:a 2 "$CHANT_MP3"

ffmpeg -y \
  -i "$OUT" \
  -i "$CHANT_MP3" \
  -shortest \
  -c:v copy \
  -c:a aac \
  -b:a 192k \
  "$ROOT/multimedia/clips/red-lobster-3d-final-audio.mp4"

mv "$ROOT/multimedia/clips/red-lobster-3d-final-audio.mp4" "$OUT"

ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT"
