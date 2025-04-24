#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: укажите ссылку на плейлист."
    exit 1
fi

PLAYLIST_URL=$1
shift

VIDEO_URLS=$(yt-dlp --flat-playlist -i --print url "$PLAYLIST_URL")

for VIDEO_URL in $VIDEO_URLS; do
    echo "Загружаем видео: $VIDEO_URL"
    ./dl-video "$VIDEO_URL" "$@"
done

echo "Плейлист успешно скачан"