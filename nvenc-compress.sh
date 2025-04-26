#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: укажите название видео в папке videos."
    exit 1
fi

function compress_video {
    ffmpeg -i videos/$1 -c:v hevc_nvenc -preset p4 -rc vbr -cq 28 -b:v 0 -c:a aac -b:a 96k videos/tmp_$1
    mv videos/tmp_$1 videos/$1
}

for video_file in "$@"; do
    compress_video $video_file
done
