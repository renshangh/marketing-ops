# OpenClaw Multimedia Capability Playbook

## Purpose
Define what OpenClaw can do today for multimedia production, especially image creation and video workflows, and how Social should use it.

## Scope
This playbook covers:
- image creation workflows
- video workflow support
- native vs tool-assisted capabilities
- setup requirements
- recommended production patterns
- limitations and blockers

## Current Capability Summary

### Image creation
OpenClaw can support image creation as a planning and orchestration layer.

Current strengths:
- turning ideas into visual briefs
- choosing layout types for social graphics
- writing generation prompts
- refining prompt variants
- describing composition, palette, spacing, and overlay-safe areas

Current dependency:
- actual image rendering is tool-assisted, typically through Gemini CLI or a similar image generator

### Video creation
OpenClaw can support video production planning and review.

Current strengths:
- video concepting
- script and hook drafting
- shot and scene planning
- frame extraction from existing videos
- review and critique of captured frames
- caption and pacing guidance for short-form content

Current dependency:
- the workspace does not show a native prompt-to-video renderer, so finished video output is likely external or tool-assisted

## Native vs Tool-Assisted Map

### Native or local support
- workflow planning
- prompt drafting
- media review
- frame extraction via ffmpeg
- template creation for recurring graphics

### Tool-assisted support
- image generation via Gemini CLI
- image refinement via generation/edit loops
- video assembly via external tooling
- short-form video production via editor or render pipeline

### Not verified here
- direct prompt-to-video generation
- direct OpenClaw-native asset rendering

## Setup Requirements

### Image generation
- Gemini CLI installed
- Gemini auth configured
- prompt templates ready
- image sizes selected before generation

### Video review
- ffmpeg installed
- frame extraction script available
- source clips or exported videos available for inspection

## Recommended Workflows

### Workflow 1: Social image creation
1. choose the format, quote, workflow, proof, or before/after
2. write the visual brief
3. generate the image through Gemini CLI
4. refine if needed
5. save into a reusable docs/media folder

### Workflow 2: Social video planning
1. write the hook
2. draft the 5 to 15 second beat structure
3. define captions and frame pacing
4. produce externally
5. extract frames for review
6. revise the edit notes

### Workflow 3: Media review
1. capture frames from the clip
2. inspect composition and readability
3. note pacing issues
4. produce revision guidance
5. store the final recommendation in docs

## Suggested Docs Structure
Use `docs/multimedia/` as the home for the deliverables.

Recommended files:
- `docs/multimedia/openclaw-multimedia-capability-playbook.md`
- `docs/multimedia/image-workflows.md`
- `docs/multimedia/video-workflows.md`
- `docs/multimedia/tooling-setup.md`
- `docs/multimedia/prompt-templates.md`

## Risks and Limitations
- Gemini auth may block generation until configured
- video generation is not yet verified as native
- media workflows should stay separated between planning and rendering
- avoid overclaiming capabilities that are not confirmed locally

## Next Actions
- confirm Gemini auth details
- build prompt templates for image generation
- define a standard video review loop
- add supporting reference docs under `docs/multimedia/`
