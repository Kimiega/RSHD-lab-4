#!/usr/bin/sh

cd "$(dirname "$0")" && cd ..

echo "[criminal] Making an out of memory error, he-he..."

sh /script/falloc.sh

for i in $(seq 1 16); do
    psql -c "CREATE TABLE oom_table_$i (content text NOT NULL);"
done

for i in $(seq 1 256); do
    psql -c "INSERT INTO worker_8_note (content) values ('aaaaaaaaaaaaa');"
done

psql -c "CHECKPOINT;"
