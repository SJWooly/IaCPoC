#!/bin/bash
set -eu

echo `date`

# @TODO potentially remove this - machine level metrics or user-facing?
status_check () {
    http_status=`curl -s -o /dev/null -w "%{http_code}" "www.google.com"`
      echo "HTTP status: $http_status"
}

cpu_usage () {
cpu_use="CPU WIP"
 echo "CPU Utilization: $cpu_use"
}

mem_usage () {
mem_free="mem WIP"
mem_use_pct="mem use pct WIP"
 echo "RAM space remaining : $mem_free MB (ie $mem_use_pct% utilised)"
}

disk_usage () {
disk_free="disk WIP"
disk_use_pct="disk use pct WIP"
 echo "Disk space remaining : $disk_free MB (ie $disk_use_pct% utilised)"
}

status_check
cpu_usage
mem_usage
disk_usage