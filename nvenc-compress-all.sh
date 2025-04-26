#!/bin/bash

for video_file in videos/*.mp4; do
    base_name=$(basename "$video_file")

    ./nvenc-compress.sh $base_name &
done

wait