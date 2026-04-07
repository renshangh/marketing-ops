# Audio Merge

## Purpose
Show how to add audio to a motion clip and how to get there from a text script.

## Standard pattern
Use ffmpeg to combine a video file and an audio file:

```bash
ffmpeg -y -i input.mp4 -i audio.mp3 -shortest -c:v copy -c:a aac -b:a 192k output-with-audio.mp4
```

## Notes
- `-shortest` keeps the output aligned to the shorter stream
- if you want to preserve full narration, make sure the video is at least as long as the audio
- use `-c:v copy` when the video is already final
- use AAC for broad compatibility
- make sure the audio bed is licensed or approved

## Optional workflow
1. finalize the script
2. generate MP3 narration with the approved TTS tool
3. render the motion clip
4. merge with ffmpeg
5. review the final export

## Timing rule
- for spoken clips, render the motion base slightly longer than the narration when needed so `-shortest` does not truncate the voice
