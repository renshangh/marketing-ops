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
}
svg {
  width: 128vw;
  height: 128vh;
  display: block;
}
.lobster-body {
  transform-box: fill-box;
  transform-origin: 50% 62%;
  animation: bodyKnock 1.05s ease-in-out infinite;
}
.claw-left {
  transform-box: fill-box;
  transform-origin: 56% 56%;
  animation: clawLeft 1.05s ease-in-out infinite;
  animation-delay: -0.14s;
}
.claw-right {
  transform-box: fill-box;
  transform-origin: 44% 56%;
  animation: clawRight 1.05s ease-in-out infinite;
  animation-delay: -0.28s;
}
@keyframes bodyKnock {
  0%, 100% { transform: translate(0px, 0px) rotate(5deg) scale(1.005); }
  18% { transform: translate(4px, -10px) rotate(11deg) scale(1.02); }
  42% { transform: translate(-8px, 14px) rotate(-8deg) scale(0.995); }
  64% { transform: translate(6px, -4px) rotate(8deg) scale(1.01); }
  84% { transform: translate(-2px, 2px) rotate(4deg) scale(1.002); }
}
@keyframes clawLeft {
  0%, 100% { transform: translate(-2px, 2px) rotate(-6deg) scale(1); }
  18% { transform: translate(-6px, 6px) rotate(-10deg) scale(1.02); }
  42% { transform: translate(-18px, 16px) rotate(-24deg) scale(1.04); }
  64% { transform: translate(-10px, 8px) rotate(-14deg) scale(1.01); }
  84% { transform: translate(-4px, 4px) rotate(-8deg) scale(1.005); }
}
@keyframes clawRight {
  0%, 100% { transform: translate(2px, 2px) rotate(6deg) scale(1); }
  18% { transform: translate(6px, 6px) rotate(10deg) scale(1.02); }
  42% { transform: translate(18px, 16px) rotate(24deg) scale(1.04); }
  64% { transform: translate(10px, 8px) rotate(14deg) scale(1.01); }
  84% { transform: translate(4px, 4px) rotate(8deg) scale(1.005); }
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
