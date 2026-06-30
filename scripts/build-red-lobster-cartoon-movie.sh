#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/multimedia/clips/_red-lobster-cartoon-build"
OUT_BASE="$ROOT/multimedia/clips/red-lobster-cartoon-base.mp4"
OUT_AUDIO="$ROOT/multimedia/clips/red-lobster-cartoon-final-audio.mp4"
VOICE_AIFF="$BUILD/red-lobster-cartoon-voice.aiff"
VOICE_MP3="$BUILD/red-lobster-cartoon-voice.mp3"
SCRIPT_FILE="$ROOT/docs/multimedia/red-lobster-cartoon-script.txt"
mkdir -p "$BUILD"

cat > "$SCRIPT_FILE" <<'TXT'
This little red lobster moves like it owns the screen.
Bright shell. Happy bounce. A playful claw wave.
Keep the cuts quick, the motion smooth, and end on one final smile.
TXT

python3 - <<'PY' "$BUILD"
from pathlib import Path
import sys
build = Path(sys.argv[1])
frames = [
    dict(name='01', bob=0, tilt=-5, left=8, right=-14, tail=-2, smile='M -86 116 Q 0 188 86 116', highlight='0.18'),
    dict(name='02', bob=-12, tilt=4, left=22, right=8, tail=6, smile='M -88 114 Q 0 200 88 114', highlight='0.22'),
    dict(name='03', bob=10, tilt=-3, left=-2, right=24, tail=-6, smile='M -86 118 Q 0 194 86 118', highlight='0.20'),
    dict(name='04', bob=-2, tilt=5, left=16, right=26, tail=4, smile='M -88 116 Q 0 196 88 116', highlight='0.22'),
]
svg_tpl = '''<svg width="1080" height="1920" viewBox="0 0 1080 1920" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#07131F"/>
      <stop offset="100%" stop-color="#020508"/>
    </linearGradient>
    <radialGradient id="glow" cx="50%" cy="44%" r="55%">
      <stop offset="0%" stop-color="#FF4D5C" stop-opacity="0.22"/>
      <stop offset="70%" stop-color="#FF4D5C" stop-opacity="0.08"/>
      <stop offset="100%" stop-color="#FF4D5C" stop-opacity="0"/>
    </radialGradient>
    <linearGradient id="shell" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#FF8B63"/>
      <stop offset="45%" stop-color="#E13530"/>
      <stop offset="100%" stop-color="#9B1A20"/>
    </linearGradient>
    <linearGradient id="shellBright" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#FFA48E"/>
      <stop offset="100%" stop-color="#F14B39"/>
    </linearGradient>
  </defs>
  <rect width="1080" height="1920" fill="url(#bg)"/>
  <path d="M 120 0 L 350 1920" stroke="#9EDCFF" stroke-width="40" opacity="0.03"/>
  <path d="M 260 0 L 500 1920" stroke="#9EDCFF" stroke-width="30" opacity="0.03"/>
  <path d="M 840 0 L 620 1920" stroke="#9EDCFF" stroke-width="36" opacity="0.04"/>
  <path d="M 980 0 L 760 1920" stroke="#9EDCFF" stroke-width="28" opacity="0.03"/>
  <circle cx="260" cy="330" r="18" fill="#8FD7FF" opacity="0.16"/>
  <circle cx="820" cy="420" r="12" fill="#8FD7FF" opacity="0.12"/>
  <circle cx="870" cy="760" r="16" fill="#8FD7FF" opacity="0.10"/>
  <circle cx="170" cy="760" r="10" fill="#8FD7FF" opacity="0.10"/>
  <path d="M 0 1450 C 160 1400 280 1440 430 1490 C 560 1535 730 1540 1080 1470 L 1080 1920 L 0 1920 Z" fill="#08131C" opacity="0.95"/>
  <path d="M 140 1920 C 150 1700 170 1620 210 1480" stroke="#2AE38B" stroke-width="18" stroke-linecap="round" opacity="0.12"/>
  <path d="M 930 1920 C 910 1700 880 1610 840 1480" stroke="#2AE38B" stroke-width="18" stroke-linecap="round" opacity="0.12"/>
  <ellipse cx="500" cy="1340" rx="300" ry="82" fill="#000" opacity="0.33"/>
  <ellipse cx="500" cy="980" rx="340" ry="420" fill="url(#glow)"/>
  <g transform="translate(430, {y}) rotate({tilt})">
    <!-- motion bubbles -->
    <circle cx="-230" cy="-300" r="8" fill="#FFFFFF" opacity="0.24"/>
    <circle cx="-180" cy="-380" r="5" fill="#FFFFFF" opacity="0.20"/>
    <circle cx="240" cy="-330" r="7" fill="#FFFFFF" opacity="0.20"/>
    <circle cx="210" cy="-430" r="4" fill="#FFFFFF" opacity="0.18"/>
    <circle cx="330" cy="-160" r="6" fill="#FFFFFF" opacity="0.20"/>
    <circle cx="-320" cy="-120" r="5" fill="#FFFFFF" opacity="0.18"/>

    <!-- antennae -->
    <path d="M -20 -280 C -90 -420 -180 -520 -270 -610" fill="none" stroke="#F3B2A3" stroke-width="10" stroke-linecap="round"/>
    <path d="M 20 -280 C 90 -420 180 -520 270 -610" fill="none" stroke="#F3B2A3" stroke-width="10" stroke-linecap="round"/>

    <!-- eyes -->
    <g>
      <line x1="-62" y1="-214" x2="-62" y2="-168" stroke="#FFF0F0" stroke-width="10" stroke-linecap="round"/>
      <line x1="62" y1="-214" x2="62" y2="-168" stroke="#FFF0F0" stroke-width="10" stroke-linecap="round"/>
      <circle cx="-62" cy="-184" r="30" fill="#1A0B0B"/>
      <circle cx="62" cy="-184" r="30" fill="#1A0B0B"/>
      <circle cx="-52" cy="-192" r="8" fill="#FFF" opacity="0.98"/>
      <circle cx="72" cy="-192" r="8" fill="#FFF" opacity="0.98"/>
      <path d="M -92 -214 Q -62 -230 -32 -214" fill="none" stroke="#0A0505" stroke-width="8" stroke-linecap="round" opacity="0.8"/>
      <path d="M 32 -214 Q 62 -230 92 -214" fill="none" stroke="#0A0505" stroke-width="8" stroke-linecap="round" opacity="0.8"/>
    </g>

    <!-- claws -->
    <g transform="rotate({left}) translate(-260,-20)">
      <path d="M 0 0 C -70 -12 -120 -40 -154 -92 C -186 -142 -176 -212 -118 -226 C -74 -236 -40 -210 -28 -180 C -16 -148 -8 -122 0 -96" fill="none" stroke="#A1151A" stroke-width="62" stroke-linecap="round"/>
      <path d="M -134 -214 C -70 -248 -20 -238 26 -202" fill="none" stroke="#FF8D71" stroke-width="14" stroke-linecap="round" opacity="0.65"/>
    </g>
    <g transform="rotate({right}) translate(260,-20)">
      <path d="M 0 0 C 70 -12 120 -40 154 -92 C 186 -142 176 -212 118 -226 C 74 -236 40 -210 28 -180 C 16 -148 8 -122 0 -96" fill="none" stroke="#A1151A" stroke-width="62" stroke-linecap="round"/>
      <path d="M 134 -214 C 70 -248 20 -238 -26 -202" fill="none" stroke="#FF8D71" stroke-width="14" stroke-linecap="round" opacity="0.65"/>
    </g>

    <!-- body -->
    <ellipse cx="0" cy="56" rx="230" ry="182" fill="url(#shell)" stroke="#5F0C11" stroke-width="12"/>
    <ellipse cx="0" cy="8" rx="166" ry="108" fill="#FFB5A3" opacity="0.12"/>
    <path d="M -142 16 C -92 -22 92 -22 142 16" fill="none" stroke="#FFD0C0" stroke-width="8" opacity="0.22"/>
    <path d="M -104 68 C -54 40 54 40 104 68" fill="none" stroke="#FFD0C0" stroke-width="8" opacity="0.18"/>

    <!-- smile -->
    <path d="{smile}" fill="none" stroke="#FFE2D7" stroke-width="12" stroke-linecap="round" opacity="0.8"/>
    <circle cx="-92" cy="52" r="10" fill="#FFBDB0" opacity="0.18"/>
    <circle cx="92" cy="52" r="10" fill="#FFBDB0" opacity="0.18"/>

    <!-- legs -->
    <g stroke="#8D1016" stroke-width="14" stroke-linecap="round" opacity="0.95">
      <path d="M -146 120 C -208 150 -260 218 -322 304"/>
      <path d="M -96 150 C -164 206 -198 286 -244 390"/>
      <path d="M -42 168 C -94 250 -108 328 -130 422"/>
      <path d="M 42 168 C 94 250 108 328 130 422"/>
      <path d="M 96 150 C 164 206 198 286 244 390"/>
      <path d="M 146 120 C 208 150 260 218 322 304"/>
    </g>

    <!-- tail fan -->
    <g transform="rotate({tail}) translate(0,238)">
      <path d="M 0 0 C -58 34 -92 96 -86 148 C -48 172 -16 186 0 192 C 16 186 48 172 86 148 C 92 96 58 34 0 0 Z" fill="url(#shellBright)" stroke="#5F0C11" stroke-width="10"/>
      <path d="M 0 16 C -38 52 -54 94 -48 132 C -26 146 -10 152 0 156 C 10 152 26 146 48 132 C 54 94 38 52 0 16 Z" fill="#FFCCB8" opacity="0.16"/>
    </g>
  </g>

</svg>
'''
for i, f in enumerate(frames, 1):
    svg = svg_tpl.format(y=1000 + f['bob'], tilt=f['tilt'], left=f['left'], right=f['right'], tail=f['tail'], smile=f['smile'])
    (build / f"frame{i}.svg").write_text(svg)
PY

for i in 1 2 3 4; do rsvg-convert -w 1080 -h 1920 "$BUILD/frame${i}.svg" -o "$BUILD/frame${i}.png"; done

ffmpeg -y -loop 1 -t 3.8 -i "$BUILD/frame1.png" -loop 1 -t 3.8 -i "$BUILD/frame2.png" -loop 1 -t 3.8 -i "$BUILD/frame3.png" -loop 1 -t 3.8 -i "$BUILD/frame4.png" -filter_complex "[0:v][1:v]xfade=transition=fade:duration=0.4:offset=3.4[v01];[v01][2:v]xfade=transition=fade:duration=0.4:offset=6.8[v02];[v02][3:v]xfade=transition=fade:duration=0.4:offset=10.2[v]" -map "[v]" -r 30 -pix_fmt yuv420p "$OUT_BASE"

say -v Samantha -r 155 -o "$VOICE_AIFF" "This little red lobster moves like it owns the screen. Bright shell. Happy bounce. A playful claw wave. Keep the cuts quick, the motion smooth, and end on one final smile."
ffmpeg -y -i "$VOICE_AIFF" -af "apad=pad_dur=2.0" -t 14 -codec:a libmp3lame -q:a 2 "$VOICE_MP3"
ffmpeg -y -i "$OUT_BASE" -i "$VOICE_MP3" -shortest -c:v copy -c:a aac -b:a 192k "$OUT_AUDIO"
ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$OUT_AUDIO"
