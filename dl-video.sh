#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: укажите ссылку на видео."
    exit 1
fi

VIDEO_URL=$1
shift
ADDITIONAL_ARGS="$@" 

VIDEO_ID=$(echo -n "$VIDEO_URL" | md5sum | awk '{print $1}')

mkdir -p "videos"

yt-dlp --write-info-json --write-thumbnail \
    -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
    -o "videos/${VIDEO_ID}" "$VIDEO_URL" $ADDITIONAL_ARGS

NAME=$(jq -r '.fulltitle' "videos/${VIDEO_ID}.info.json")
DESCRIPTION=$(jq -r '.description' "videos/${VIDEO_ID}.info.json")
CHANNEL_NAME=$(jq -r '.uploader' "videos/${VIDEO_ID}.info.json")
CHANNEL_ID=$(jq -r '.channel_id' "videos/${VIDEO_ID}.info.json")
CHANNEL_URL=$(jq -r '.uploader_url' "videos/${VIDEO_ID}.info.json")

yt-dlp --write-thumbnail --skip-download --playlist-items 0 -o "videos/${CHANNEL_ID}" "$CHANNEL_URL" $ADDITIONAL_ARGS

jq --arg name "$NAME" --arg description "$DESCRIPTION" --arg video_file "${VIDEO_ID}.mp4" \
   --arg image_file "${VIDEO_ID}.png" --arg channel_name "$CHANNEL_NAME" \
   --arg channel_avatar_file "${CHANNEL_ID}.png" \
   '{
     name: $name,
     description: $description,
     "video-file": $video_file,
     "image-file": $image_file,
     "channel-name": $channel_name,
     "channel-avatar-file": $channel_avatar_file
   }' \
   "videos/${VIDEO_ID}.info.json" > "videos/${VIDEO_ID}.tmp.json" && mv "videos/${VIDEO_ID}.tmp.json" "videos/${VIDEO_ID}.json"

rm "videos/${VIDEO_ID}.info.json"

echo "Видео успешно скачано"