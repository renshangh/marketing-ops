#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path

from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
CHROME = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"


def inject_anim(svg_text: str) -> str:
    svg_text = svg_text.replace(
        '<g transform="translate(450, 1000) scale(1.2)">',
        '<g class="lobster-body" transform="translate(450, 1000) scale(1.2)">',
    )
    svg_text = svg_text.replace(
        '<g transform="translate(-150, -50) rotate(-20)">',
        '<g class="claw claw-left" transform="translate(-150, -50) rotate(-20)">',
    )
    svg_text = svg_text.replace(
        '<g transform="translate(150, -50) rotate(20) scale(-1, 1)">',
        '<g class="claw claw-right" transform="translate(150, -50) rotate(20) scale(-1, 1)">',
    )
    style = """
<style>
html, body {
  margin: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: #06131c;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
}
.scene {
  width: 100vw;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  transform-origin: 50% 64%;
  animation: bodyKnock 0.95s ease-in-out infinite;
}
svg {
  width: 125vw;
  height: 125vh;
  display: block;
}
.claw-left {
  transform-box: fill-box;
  transform-origin: 56% 56%;
  animation: clawLeft 0.95s ease-in-out infinite;
  animation-delay: -0.10s;
}
.claw-right {
  transform-box: fill-box;
  transform-origin: 44% 56%;
  animation: clawRight 0.95s ease-in-out infinite;
  animation-delay: -0.20s;
}
@keyframes bodyKnock {
  0%, 100% { transform: translate(0px, 0px) rotate(5deg) scale(1.01); }
  22% { transform: translate(6px, -12px) rotate(11deg) scale(1.03); }
  50% { transform: translate(-12px, 20px) rotate(-7deg) scale(0.98); }
  78% { transform: translate(4px, -4px) rotate(8deg) scale(1.01); }
}
@keyframes clawLeft {
  0%, 100% { transform: translate(-4px, 4px) rotate(-8deg); }
  22% { transform: translate(-8px, 6px) rotate(-12deg); }
  50% { transform: translate(-22px, 18px) rotate(-28deg); }
  78% { transform: translate(-10px, 8px) rotate(-15deg); }
}
@keyframes clawRight {
  0%, 100% { transform: translate(4px, 4px) rotate(8deg); }
  22% { transform: translate(8px, 6px) rotate(12deg); }
  50% { transform: translate(22px, 18px) rotate(28deg); }
  78% { transform: translate(10px, 8px) rotate(15deg); }
}
</style>
"""
    html = f"""<!doctype html>
<html>
  <head>
    <meta charset=\"utf-8\" />
    {style}
  </head>
  <body>
    <div class=\"scene\">{svg_text}</div>
  </body>
</html>
"""
    return html


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--svg", default=str(ROOT / "multimedia/graphics/red-lobster-3d-source.svg"))
    ap.add_argument("--html", default=str(ROOT / "multimedia/clips/_red-lobster-action.html"))
    ap.add_argument("--frames", default=str(ROOT / "multimedia/clips/_red-lobster-frames"))
    ap.add_argument("--fps", type=int, default=30)
    ap.add_argument("--duration", type=float, default=6.0)
    args = ap.parse_args()

    svg_path = Path(args.svg)
    html_path = Path(args.html)
    frames_dir = Path(args.frames)
    frames_dir.mkdir(parents=True, exist_ok=True)

    svg_text = svg_path.read_text()
    html_path.write_text(inject_anim(svg_text))

    frame_count = int(round(args.fps * args.duration))
    wait_ms = int(round(1000 / args.fps))

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True, executable_path=CHROME)
        page = browser.new_page(viewport={"width": 1080, "height": 1920}, device_scale_factor=1)
        page.goto(html_path.as_uri(), wait_until="load")
        page.wait_for_timeout(1000)
        for i in range(frame_count):
            page.screenshot(path=str(frames_dir / f"frame{i:04d}.png"), full_page=False)
            page.wait_for_timeout(wait_ms)
        browser.close()

    print(frames_dir)


if __name__ == "__main__":
    main()
