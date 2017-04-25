#!/bin/bash

base="/var/www/html"

cd $base

raspivid --nopreview \
    -w 1920 \
    -h 1080 \
    --framerate 25 \
    --bitrate 2200000 \
    --timeout 0 \
    --awb shade \
    -ae 24,0x00,0x8080ff \
    -a 1032 -a "CAMERA %a, %e %b %Y %H:%M:%S GMT%z" \
    -ih \
    --output - \
 | ffmpeg -y \
    -r 25 \
    -i - \
    -c:v copy \
    -map 0:0 \
    -framerate 25 \
    -f segment \
    -segment_time 2 \
    -segment_list "$base/live.m3u8" \
    -segment_list_size 20 \
    -segment_wrap 100 \
    -segment_format mpegts \
    -segment_list_flags +live \
    -segment_list_type m3u8 \
    -segment_list_entry_prefix /segments/ \
    "$base/segments/%03d.ts"  

trap "rm $base/live.m3u8 $base/segments/*.ts" EXIT
