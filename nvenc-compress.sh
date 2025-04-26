#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: укажите название видео в папке videos."
    exit 1
fi

function compress_video {
    ffmpeg -i videos/$1 -c:v hevc_nvenc -tune ll -crf 26 -preset p7 videos/tmp_$1
    mv videos/tmp_$1 videos/$1
}

for video_file in "$@"; do
    compress_video $video_file
done
