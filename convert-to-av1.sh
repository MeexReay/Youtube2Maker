#!/bin/bash

for video_file in videos/*.mp4; do
    base_name=$(basename "$video_file" .mp4)

    codec_check=$(ffmpeg -i "$video_file" 2>&1 | grep -o 'Video: av1')
    if [[ -n "$codec_check" ]]; then
        echo "Skipping $video_file as it already AV1 encoded"
        continue
    fi

    echo "Converting videos/$base_name.mp4 to videos/$base_name.av1.mp4"

    ffmpeg -i "videos/$base_name.mp4" -c:v libsvtav1 -crf 23 -b:v 0 -cpu-used 4 -g 240 -strict -2 "videos/$base_name.av1.mp4" || exit 1

    for json_file in videos/*.json; do
        sed -i "s/$base_name.mp4/$base_name.av1.mp4/g" "$json_file"
    done

    rm videos/$base_name.mp4
done