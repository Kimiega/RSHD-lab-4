#!/usr/bin/sh

rm -rf $PGDATA

set -e

pg_basebackup \
    --pgdata=$PGDATA \
    --write-recovery-conf \
    --slot=replication_slot \
    --create-slot \
    --checkpoint=fast \
    --host=primary \
    --port=5432

chown -Rf postgres:postgres $PGDATA
chmod -R 700 $PGDATA

echo "promote_trigger_file = '/failover_dir/down.trg'" >>$PGDATA/postgresql.conf
echo "wal_log_hints = on" >>$PGDATA/postgresql.conf

su -p postgres -c "postgres"
