#!/usr/bin/env bash


IFS='_' read -r -a array <<< "$1"

duration=${array[0]}
device=${array[1]}
id=${array[2]}

./arecord mic$id.wav $device
