#!/usr/bin/sh

FAILED_NODE=$1
TRIGGER_FILE=$2

if [ $FAILED_NODE = 1 ]; then 
    # echo "Failover ignores node $FAILED_NODE"
    exit 0;
fi

touch /failover_dir/$TRIGGER_FILE
