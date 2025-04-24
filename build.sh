#!/bin/bash

mkdir build
cp -r root build/iso
cp -r www build/iso/www
cp -r videos build/iso/www/videos
find videos -type f -name "*.json" | sed 's|^videos/||; s|\.json$||' > build/iso/www/videos.txt
truncate -s -1 build/iso/www/videos.txt
mkisofs -o build/youtube2.iso -V "Youtube2" -J -r build/iso