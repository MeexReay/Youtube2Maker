#!/bin/bash

for video_file in videos/*.mp4; do
    base_name=$(basename "$video_file" .mp4)

    ffmpeg -i "$video_file" \
        -vf "scale='min(1920,iw)':'min(1080,ih)':force_original_aspect_ratio=decrease" \
        -c:v libx264 -preset slow -crf 23 \
        -c:a copy \
        "videos/${base_name}.compressed.mp4" || exit 1

    for json_file in videos/*.json; do
        sed -i "s/$base_name.mp4/$base_name.compressed.mp4/g" "$json_file"
    done

    rm videos/$base_name.mp4
done