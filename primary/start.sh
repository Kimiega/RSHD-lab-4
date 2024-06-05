#!/usr/bin/sh

pg_rewind \
    --config-file=/postgresql.conf \
    --source-server='host=postgres_replica user=postgres password=password' \
    --target-pgdata=/data/postgres

postgres -c 'config_file=/postgresql.conf'
