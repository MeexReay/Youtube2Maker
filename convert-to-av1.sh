#!/bin/bash

for video_file in videos/*.mp4; do
    base_name=$(basename "$video_file" .mp4)

    ffmpeg -i "$video_file" -c:v libaom-av1 -crf 23 -b:v 0 -cpu-used 4 -g 240 -strict -2 "videos/$base_name.av1.mp4" || exit 1
    
    mv "videos/$base_name.av1.mp4" "$video_file"
done