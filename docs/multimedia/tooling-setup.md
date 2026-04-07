# Tooling Setup

## Purpose
Document the local setup needed to support multimedia workflows.

## Current tools
- Gemini CLI
- ffmpeg
- GitHub CLI helper wrapper

## Requirements
- Gemini auth must be available before image generation
- ffmpeg must be installed for video frame extraction
- the workspace GH token must be accessible through `workspace-social/.env`

## Helper wrapper
Use the helper script to load the workspace token for a single command:

- `scripts/with-workspace-gh-token.sh`

## Common commands
- `gh issue view 36`
- `gh issue edit 36`
- `gh issue comment 36`
- `git push origin main`

## Notes
- keep token loading scoped to the command
- do not rely on the ambient shell token state
- use the helper when pushing or updating GitHub issues
