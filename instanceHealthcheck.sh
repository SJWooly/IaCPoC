#!/bin/bash
set -eu

echo Health Check Status Report
echo `date`

# @TODO potentially remove this - machine level metrics or user-facing?
status_check () {
    http_status=`curl -s -o /dev/null -w "%{http_code}" "www.google.com"`
      echo "HTTP status: $http_status"
}

cpu_usage () {
cpu_usage_pct=`top -b -n1 | grep ^%Cpu | awk '{print "CPU usage (%): " 100-$8}'`
 echo "$cpu_usage_pct"
}

mem_usage () {
mem_usage_pct=`free -t | awk 'NR == 2 {print "Memory usage(%): " $3/$2*100}'`
 echo "$mem_usage_pct"
}

swap_usage () {
swap_usage=`free -t | awk 'NR == 3 {print "Swap usage (%): " $3/$2*100}'`
 echo "$swap_usage"
}

status_check
cpu_usage
mem_usage
swap_usage