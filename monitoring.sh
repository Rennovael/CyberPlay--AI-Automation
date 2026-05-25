#!/bin/bash

LOG="logs/cyberplay.log"

# Create logs directory if it doesn't exist
mkdir -p logs

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
MEMORY=$(free -m | awk 'NR==2{printf "%sMB/%sMB", $3,$2}')

ping -c 1 google.com > /dev/null

if [ $? -eq 0 ]; then
    STATUS="Jaringan Normal"
else
    STATUS="Jaringan Bermasalah"
fi

echo "$(date) | CPU: $CPU% | Memory: $MEMORY | Status: $STATUS" >> $LOG

cat $LOG
