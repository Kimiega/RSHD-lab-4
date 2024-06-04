#!/bin/bash
failed_node=$1
trigger_file=$2

if [ $failed_node = 1 ];
then exit 0;
fi

touch /failover_dir/$trigger_file
exit 0;