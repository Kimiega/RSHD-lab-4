#!/usr/bin/sh

pg_rewind \
    --config-file=/data/postgres/postgresql.conf \
    --source-server='host=postgres_replica user=postgres password=password' \
    --target-pgdata=/data/postgres

postgres -c 'config_file=/data/postgres/postgresql.conf'
