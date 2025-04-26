#!/bin/bash

function compress_video {
    ffmpeg -i videos/$1 -c:v hevc_nvenc -preset p4 -rc vbr -cq 28 -b:v 0 -c:a aac -b:a 96k videos/tmp_$1
    mv videos/tmp_$1 videos/$1
}

for video_file in videos/*.mp4; do
    base_name=$(basename "$video_file")

    compress_video $base_name &
done

wait