killall -2 multimic
rm *lck
time=$(date +%s)
mkdir recordings_$time
mv *.wav recordings_$time
mv finish_times.csv recordings_$time

