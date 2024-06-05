#!/usr/bin/sh

fallocate -l $(df -k | grep -e " /data$" | awk '{print $4}')'K' /data/trashfile
