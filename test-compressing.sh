#!/bin/bash

mkdir -p test

echo "download test video"
yt-dlp -o test/video -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" https://www.youtube.com/watch?v=G3C-VevI36s

# echo "av1 test 1"
# ffmpeg -i "test/video.mp4" -c:v libsvtav1 -crf 23 -b:v 0 -cpu-used 4 -g 240 -strict -2 "test/video.av1.1.mp4" &
# echo "av1 test 2"
# ffmpeg -i "test/video.mp4" -c:v libsvtav1 -crf 23 "test/video.av1.2.mp4" &
# echo "av1 test 3"
# ffmpeg -i "test/video.mp4" -c:v libsvtav1 -crf 30 "test/video.av1.3.mp4" &
# echo "av1 test 4"
# ffmpeg -i "test/video.mp4" -c:v libsvtav1 "test/video.av1.4.mp4" &
# wait
# echo "libaom-av1 test 1"
# ffmpeg -i "test/video.mp4" -c:v libaom-av1 -crf 23 -b:v 0 -cpu-used 4 -g 240 -strict -2 "test/video.libaom-av1.1.mp4" &
# echo "libaom-av1 test 2"
# ffmpeg -i "test/video.mp4" -c:v libaom-av1 -crf 23 "test/video.libaom-av1.2.mp4" &
# echo "libaom-av1 test 3"
# ffmpeg -i "test/video.mp4" -c:v libaom-av1 -crf 30 "test/video.libaom-av1.3.mp4" &
# echo "libaom-av1 test 4"
# ffmpeg -i "test/video.mp4" -c:v libaom-av1 "test/video.libaom-av1.4.mp4" &
# wait
# echo "nvenc test 1"
# ffmpeg -i "test/video.mp4" -c:v hevc_nvenc -tune ll -crf 26 -preset p7 "test/video.nvenc.1.mp4" &
# echo "nvenc test 2"
# ffmpeg -i "test/video.mp4" -c:v hevc_nvenc -crf 26 -preset p7 "test/video.nvenc.2.mp4" &
# wait
# echo "nvenc test 3"
# ffmpeg -i "test/video.mp4" -c:v hevc_nvenc -crf 30 -preset p7 "test/video.nvenc.3.mp4" &
# echo "nvenc test 4"
# fmpeg -i "test/video.mp4" -c:v hevc_nvenc -crf 30 "test/video.nvenc.4.mp4" &
# wait
# echo "nvenc test 5"
# ffmpeg -i "test/video.mp4" -c:v hevc_nvenc -preset p7 "test/video.nvenc.5.mp4" &
# echo "nvenc test 6"
# ffmpeg -i "test/video.mp4" -c:v hevc_nvenc "test/video.nvenc.6.mp4" &
# wait
ffmpeg -i "test/video.mp4" \
  -c:v h264_nvenc \
  -preset p7 \
  -tune hq \
  -cq 50 \
  -profile main "test/video.nvenc.7.mp4"
