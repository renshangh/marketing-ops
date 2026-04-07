# Audio Merge

## Purpose
Show how to add audio to a motion clip.

## Standard pattern
Use ffmpeg to combine a video file and an audio file:

```bash
ffmpeg -y -i input.mp4 -i audio.mp3 -shortest -c:v copy -c:a aac -b:a 192k output-with-audio.mp4
```

## Notes
- `-shortest` keeps the output aligned to the shorter stream
- use `-c:v copy` when the video is already final
- use AAC for broad compatibility
- make sure the audio bed is licensed or approved

## Optional workflow
1. render the motion clip
2. select a music bed or ambient track
3. merge with ffmpeg
4. review the final export
