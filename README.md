# MemUsage
Working on a shell script that takes a command as an argument, runs that command, then gives back how much memory the command was using (may add other performance statistics as time goes on)

The way this works is you run the script in the directory you have it in and pass it the command you want to run as an argument (use quotes):

./mem_use.sh "\<command\>"

The output will produce something like this:

Command: \<command you passed\>

PID: 4425

time: 12962us

Mem: 880 kB

**\*\*Note that the output of the command you passed WILL NOT be shown in the output of the script, the main focus of this script is to find out 
performance statistics of the command you are trying to run, and not the output of the command itself!\*\***

This is still experimental so the memory may only be an APPROXIMATE value, as well as the time too. As another note, the script
doesn't work with all commands, this can be seen when an error like

"awk: cmd. line:1: fatal: cannot open file `/proc/4425/smaps' for reading (No such file or directory)"

is in the output.

This script will be ever-changing to become more accurate and become more generalized to use any-and-all commands passed to it.
