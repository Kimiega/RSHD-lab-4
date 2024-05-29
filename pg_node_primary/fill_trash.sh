#!/bin/bash
cd /data
touch trash
until ! echo "0" >> trash
do
	:
done
exit 0