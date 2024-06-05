#!/usr/bin/sh

pg_basebackup \
    --pgdata=/data/postgres \
    --write-recovery-conf \
    --slot=replication_slot \
    --create-slot \
    --checkpoint=fast \
    --host=primary \
    --port=5432

chown -Rf postgres:postgres /data/postgres
chmod -R 700 /data/postgres

echo -e "promote_trigger_file = '/failover_dir/down.trg'" \
    >> /data/postgres/postgresql.conf

su -p postgres -c "postgres -c 'config_file=/data/postgres/postgresql.conf'"
