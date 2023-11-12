#!/bin/bash
# This script monitors CPU  usage

while :
do 
  # Get the current usage of CPU and memory
  cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
  previous10=0
  previous75=76
 

  # Print the usage
  echo "CPU Usage: $cpuUsage%"

  if[$cpuUsage -gt '75' && $previous75 -lt '75']then
    echo "we want email alert"
    $previous75=$cpuUsage
  else 
    $previous75=$cpuUsage
  fi
  if[$cpuUsage -lt '10' && $previous10 -gt '10']then
    echo "we want email alert";revious10=$cpuUsage
  else
    $previous10=$cpuUsage
  fi
 
  # Sleep for 100 second
  sleep 100
done