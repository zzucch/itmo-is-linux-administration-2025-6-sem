#!/bin/bash

pid=$1
group_name="dynamic_process_$pid"

cgcreate -g cpu:/"$group_name"

echo "$pid" >>/sys/fs/cgroup/"$group_name"/cgroup.procs

while true; do
    cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)

    if [ "$cpu_load" -lt 20 ]; then
        cgset -r cpu.max="80000 100000" "$group_name"
    elif [ "$cpu_load" -gt 60 ]; then
        cgset -r cpu.max="30000 100000" "$group_name"
    fi

    sleep 5
done
