#! /bin/bash


ls -1tr | grep -v files.txt > files.txt
mencoder -nosound -noskip -oac copy -ovc copy -o output.avi -mf fps=15 'mf://@files.txt'
ffmpeg -i output.avi -y -s hd1080 -sameq final.avi

rm files.txt output.avi
