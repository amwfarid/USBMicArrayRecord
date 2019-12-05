#!/usr/bin/env bash

rm *.wav

rm *mic*

rm finish_times.csv

touch finish_times.csv

#parallel ./record_param.sh ::: 10_hw:2,0_1 10_hw:3,0_2 10_hw:4,0_3 10_hw:5,0_4 10_hw:6,0_5 10_hw:7,0_6 10_hw:8,0_7 10_hw:9,0_8

parallel ./record_param.sh ::: 10_hw:1,0_1 10_hw:3,0_2 10_hw:4,0_3 10_hw:5,0_4 10_hw:6,0_5 10_hw:7,0_6 10_hw:8,0_7 10_hw:9,0_8
