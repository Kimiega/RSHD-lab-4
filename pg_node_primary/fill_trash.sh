#!/bin/bash
fallocate -l $(df -k | grep -e "/data/postgres$" | awk '{print $4}')'K' /data/postgres/trashfile