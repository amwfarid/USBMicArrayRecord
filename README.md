# Microphone Array Recording

This is a mixer-less implementation for recording, which currently is a modification of ALSA-Util's arecord code (forked from [here](https://github.com/certik/record)).

## Operation

It is required that you have parallel installed:

`sudo apt install parallel`

To run the recording, simply do:

`sh multi_mic_record.sh`

To stop the recording, it is recommended that you run this script:
`sh stop_recording.sh`

You may want to `chmod +x` the scripts first to make sure they can execute.

## Customization

The present operational procedures is as follows:
1. we start a thread for each USB microphone (8 in total).
2. A thread is comprised of `./arecord [WAV file name] [interface name (e.g. HW:2,0)]`
3. Each thread creates a `.lck` file.
4. When all `.lck` files have been created and detected, start the recording.

To customize the `.lck` mechanism according to your needs, refer to line 1042 in `arecord.c`

To compile the code, simply do:
`gcc -o arecord arecord.c -lasound`

You may need to install the following dependency to compile:
`sudo apt-get install libasound2-dev`

## Alternatives to this implementation

If you are on a MAC, you may want to consider merging the separate USB interfaces into one as done [here](https://support.apple.com/en-us/HT202000).

For linux, in prinicple it is the same for Mac but is done using the [JACK Audio Connection Kit](https://jackaudio.org/). It might be tricky to get it up and running.

## Issues and Future work
1. We may consider implementing pthreads directly into the c code.
2. There is a feature in which the start/end times are printed into a `.csv` file. Presently,  there is a bug where a zero appears in one of the start times.
3. Add further customizations for sampling rate, profiles... etc.

