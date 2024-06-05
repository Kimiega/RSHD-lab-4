#!/usr/bin/sh

set -e
cd "$(dirname "$0")" && cd ..
. libsh/color.sh --source-only

coprintln $Red "[criminal] Making an out of memory error, he-he..."

sh /script/falloc.sh

for i in $(seq 1 16); do
    pqsl -c "CREATE TABLE oom_table_$i ();"
done
