#!/bin/bash

PID=$1
GROUP_NAME="dynamic_process_$PID"

cgcreate -g cpu:/"$GROUP_NAME"

echo "$PID" >>/sys/fs/cgroup/"$GROUP_NAME"/cgroup.procs

while true; do
    CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)

    if [ "$CPU_LOAD" -lt 20 ]; then
        cgset -r cpu.max="80000 100000" "$GROUP_NAME"
    elif [ "$CPU_LOAD" -gt 60 ]; then
        cgset -r cpu.max="30000 100000" "$GROUP_NAME"
    fi

    sleep 5
done
