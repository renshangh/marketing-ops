# TTS + Audio Workflow

## Purpose
Document the standard path from script to MP3 to final video mix.

## Recommended workflow
1. write and finalize the spoken script
2. review the script for pacing and pronunciation
3. generate an MP3 using the approved text-to-speech tool
4. trim or normalize the audio if needed
5. render the motion clip or video base
6. merge audio and video with ffmpeg
7. review the final export

## Standard use case
This is the normal approach when the video needs spoken narration or a clean voice bed.

## Localized versions
- translate the script first
- choose a matching localized voice
- keep the same ffmpeg merge flow
- use the localized graphic version when the visual language changes

## Audio file rule
- use MP3 as the default intermediate format
- keep the narration length aligned with the final video duration
- if the narration runs long, render the motion base slightly longer so the audio is not cut off
- make sure the voice track is approved or licensed

## ffmpeg merge pattern
```bash
ffmpeg -y -i input.mp4 -i audio.mp3 -shortest -c:v copy -c:a aac -b:a 192k output-with-audio.mp4
```

## Notes
- prepare the script before generating audio
- use TTS to produce a clean MP3 first
- use ffmpeg to combine the final audio and video assets
- keep the final clip within the 10 to 15 second standard when possible
- when using narration, make the motion base long enough to preserve the full voice track
