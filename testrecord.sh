#!/usr/bin/env bash

rm *.wav

rm finish_times.txt

touch finish_times.txt

duration=10

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:2,0 test1_$(date +%s%N | cut -b1-13).wav && echo Test1 $(date +%s%N | cut -b1-13) >> finish_times.txt &

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:3,0 test2_$(date +%s%N | cut -b1-13).wav && echo Test2 $(date +%s%N | cut -b1-13) >> finish_times.txt &

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:4,0 test3_$(date +%s%N | cut -b1-13).wav && echo Test3 $(date +%s%N | cut -b1-13) >> finish_times.txt  &

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:5,0 test4_$(date +%s%N | cut -b1-13).wav && echo Test4 $(date +%s%N | cut -b1-13) >> finish_times.txt  &

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:6,0 test5_$(date +%s%N | cut -b1-13).wav && echo Test5 $(date +%s%N | cut -b1-13) >> finish_times.txt  &

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:7,0 test6_$(date +%s%N | cut -b1-13).wav && echo Test6 $(date +%s%N | cut -b1-13) >> finish_times.txt  &

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:8,0 test7_$(date +%s%N | cut -b1-13).wav && echo Test7 $(date +%s%N | cut -b1-13) >> finish_times.txt  &

arecord -d $duration -f S16_LE -c 1 -r 44100 -D hw:9,0 test8_$(date +%s%N | cut -b1-13).wav && echo Test8 $(date +%s%N | cut -b1-13) >> finish_times.txt  &

disown
