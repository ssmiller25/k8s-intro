#!/bin/sh

# Set LOGDIR to "/tmp/logdir" if not already set in envirnoment
LOGDIR=${LOGDIR:="/tmp/logdir"}

MAXAGE=${MAXAGE:="7"}

# Only printing files to delete for safety.  To really remove, add `| xargs rm`
find ${LOGDIR} -mtime +${MAXAGE} | xargs ls -l