## Stream to youtube with ffmpeg
## recieve stream from Sony PXW-X70
## Author: 2015 Philipp Gassmann (phiphi@phiphi.ch)
## Any copyright is dedicated to the Public Domain.
## http://creativecommons.org/publicdomain/zero/1.0/

# Download ffmpeg binary package for windows from here:
# http://ffmpeg.zeranoe.com/builds/

##To enable powerscripts run the following command in a Administrator PowerShell
#set-executionpolicy remotesigned
## Execute this script in Windows PowerShell with .\stream_from_pxw_x70.ps1

$VBR="2500k"                                    # Bitrate to stream
$MAX="4000k"                                    # Max Bitrate
$FPS=25                                         # Framerate
$QUAL="medium"                                  # FFMPEG Quality
$YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2"  # Youtube Server

$SOURCE="udp://0.0.0.0:1234?fifo_size=1024000&overrun_nonfatal=1"   # Listen on port 1234, add buffering and recover from failures
$KEY="<Replace with your key>"                               # Stream Name from Youtube https://www.youtube.com/my_live_events
$LOGO="logo.png"                                             # Logo only appears on first stream (Youtube)
$SAVETO = "Stream.ts" -replace ' ', '` '

## executable
$ffmpeg = "$HOME\Documents\streaming\ffmpeg-20150715-git-90dd6ad-win64-static\bin\ffmpeg.exe" -replace ' ', '` '

# Display the video, save it to disk, add logo in upper right corner and stream it to youtube.
Invoke-Expression "$ffmpeg -thread_queue_size 1024 ``
    -i '$SOURCE' ``
    -i $LOGO -filter_complex '[0:v] [1:v] overlay=W-w-10:10'``
    -vcodec libx264  -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -maxrate $MAX -b:v $VBR ``
    -acodec libmp3lame -ar 44100 -threads 6 -crf 28 -b:a 712000 -bufsize 2000k ``
    -f flv '$YOUTUBE_URL/$KEY' ``
    -vcodec rawvideo -pix_fmt yuv420p -f sdl 'Live Preview' ``
    -c copy -f mpegts $SAVETO"

## Just display:
# Invoke-Expression "$ffmpeg ``
  # -i $SOURCE ``
  # -vcodec rawvideo -pix_fmt yuv420p -f sdl 'Live Preview'"