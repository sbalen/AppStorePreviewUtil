#!/bin/sh

# Author : Sbalen

#take screencapture and resize to appstore format
ffmpeg -i iphone8plus.mp4 -acodec copy -an -crf 12 -vf scale=1080:1920,setsar=1:1,fps=30 -v:b 500 iphone8plus_resize.mp4
#add a empty stereotrack
ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i iphone8plus_resize.mp4 -shortest -c:v copy -c:a aac iphone8plus_silence.mp4
#cut last sec
ffmpeg -i iphone8plus_silence.mp4 -ss 00:00:00 -t 00:00:30 -async 1 -strict -2 iphone8plus_final.mp4

#take screencapture and resize to appstore format
ffmpeg -i 11promax.mp4 -acodec copy -an -crf 12 -vf scale=886:1920,setsar=1:1,fps=30 -v:b 500 11promax_resize.mp4
#add a empty stereotrack
ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i 11promax_resize.mp4 -shortest -c:v copy -c:a aac 11promax_final.mp4

#take screencapture and resize to appstore format
ffmpeg -i iPad5th.mp4 -acodec copy -an -crf 12 -vf scale=1200:1600,setsar=1:1,fps=30 -v:b 500 iPad5th_resize.mp4
#add a empty stereotrack
ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i iPad5th_resize.mp4 -shortest -c:v copy -c:a aac iPad5th_silence.mp4
#cut 1 sec and last 2 sec
ffmpeg -i iPad5th_silence.mp4 -ss 00:00:01 -t 00:00:30 -async 1 -strict -2 iPad5th_final.mp4

rm *_silence.mp4
rm *_resize.mp4
