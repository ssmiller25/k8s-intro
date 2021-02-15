#!/bin/sh

# Set LOGDIR to "/tmp/logdir" if not already set in envirnoment
LOGDIR=${LOGDIR:="/tmp/logdir"}

# Create directory
mkdir -p $LOGDIR

# Generate 14 days of empty files
for i in $(seq 1 14); do
  newdate=$(date +%Y%m%d -d now-${i}days)
  touch -d ${newdate} ${LOGDIR}/file-${i}.log
done
