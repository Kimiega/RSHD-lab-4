#!/usr/bin/sh

pg_basebackup \
    --pgdata=/data/postgres \
    --write-recovery-conf \
    --slot=replication_slot \
    --create-slot \
    --checkpoint=fast \
    --host=standby \
    --port=5432

echo -e \"promote_trigger_file = '/failover_dir/down.trg'\" \
    >> /data/postgres/postgresql.conf
