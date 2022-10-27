#!/bin/sh

# Author : Sbalen

# EXPECTS 4 FILES TO BE PRESENT IN ./
#    - 8plus.mp4
#    - 11promax.mp4
#    - ipad2nd.mp4
#    - ipad5th.mp4
# OUTPUTS 4 FILES ./ IN DIMENSIONS APP STORE WILL ACCEPT


# 8PLUS
# ADJUST RESOLUTION AND SUBSAMPLE
ffmpeg -i 8plus.mp4 -acodec copy -an -crf 12 -vf scale=1080:1920,setsar=1:1,fps=30 -v:b 500 8plus_resize.mp4
# REMOVE SOUNDTRACK FOR EMPTY TRACK
ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i 8plus_resize.mp4 -shortest -c:v copy -c:a aac 8plus_silence.mp4
# CUT DOWN TO 30 SECS
ffmpeg -i 8plus_silence.mp4 -ss 00:00:00 -t 00:00:30 -async 1 -strict -2 8plus_final.mp4

# 11PROMAX
# ADJUST RESOLUTION AND SUBSAMPLE
ffmpeg -i 11promax.mp4 -acodec copy -an -crf 12 -vf scale=886:1920,setsar=1:1,fps=30 -v:b 500 11promax_resize.mp4
# REMOVE SOUNDTRACK FOR EMPTY TRACK
ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i 11promax_resize.mp4 -shortest -c:v copy -c:a aac 11promax_silence.mp4
# CUT DOWN TO 30 SECS
ffmpeg -i 11promax_silence.mp4 -ss 00:00:00 -t 00:00:30 -async 1 -strict -2 11promax_final.mp4

# IPAD 2DN GEN
# ADJUST RESOLUTION AND SUBSAMPLE
ffmpeg -i ipad2nd.mp4 -acodec copy -an -crf 12 -vf scale=1200:1600,setsar=1:1,fps=30 -v:b 500 ipad2nd_resize.mp4
# REMOVE SOUNDTRACK FOR EMPTY TRACK
ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i ipad2nd.mp4 -shortest -c:v copy -c:a aac ipad2nd_silence.mp4
# CUT DOWN TO 30 SECS
ffmpeg -i ipad2nd_silence.mp4 -ss 00:00:00 -t 00:00:30 -async 1 -strict -2 ipad2nd_final.mp4

# IPAD 6TH GEN
# ADJUST RESOLUTION AND SUBSAMPLE
ffmpeg -i ipad6th.mp4 -acodec copy -an -crf 12 -vf scale=1200:1600,setsar=1:1,fps=30 -v:b 500 ipad6th_resize.mp4
# REMOVE SOUNDTRACK FOR EMPTY TRACK
ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -i ipad6th_resize.mp4 -shortest -c:v copy -c:a aac ipad6th_silence.mp4
# CUT DOWN TO 30 SECS
ffmpeg -i ipad6th_silence.mp4 -ss 00:00:00 -t 00:00:30 -async 1 -strict -2 ipad6th_final.mp4

rm *_silence.mp4
rm *_resize.mp4
