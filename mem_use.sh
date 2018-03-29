#!/bin/bash
#cd Test
cmd=$1
user=`whoami`
echo "Command: $cmd"
used1=`free | grep Mem | awk '{print $3}'`
time1=`date +%s%6N`;
bash -c "exec $cmd > /dev/null 2>&1 &"
#echo `ps -ef | grep -P "$cmd"`
temp=`ps -ef | grep -P "$cmd"` #| awk '{print $2}'`
IFS=' ' read -r -a array <<< "$temp"
PID="${array[1]}"
echo "PID: $PID"
mem=`awk 'BEGIN { used=0 }; /Rss/ { used += $2 } END { print used }' /proc/$PID/smaps`
time2=`date +%s%6N`
used2=`free | grep Mem | awk '{print $3}'`
#echo $used2
#echo $used1
#echo $time2
#echo $time1
echo "time: $[time2 - time1]us"
#echo "Mem used: ~$[used2 - used1] bytes"
echo "Mem: $mem kB"
pkill -f cmd_proc