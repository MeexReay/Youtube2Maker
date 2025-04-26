#!/bin/bash

rm -rf build
mkdir build
cp -lR root build/iso
cp -lR www build/iso/www
cp -lR videos build/iso/www/videos
rm build/iso/www/videos/video-example.json
echo "const videos = [" > build/iso/www/videos.js
for i in build/iso/www/videos/*.json; do
  cat $i >> build/iso/www/videos.js
  echo "," >> build/iso/www/videos.js
done
echo "]" >> build/iso/www/videos.js
rm build/iso/www/videos/*.json
mkisofs -r -J -o build/youtube2.iso -V "Youtube2" build/iso