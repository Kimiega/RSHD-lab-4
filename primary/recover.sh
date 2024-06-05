#!/usr/bin/sh

if [ -d /data/postgres ]; then
  su -p postgres -c "pg_rewind \
    --config-file=/data/postgres/postgresql.conf \
    --source-server='host=standby user=postgres password=password' \
    --target-pgdata=/data/postgres"  
else
  mkdir /data/postgres
fi

chown -Rf postgres:postgres /data/postgres
chmod -R 700 /data/postgres

su -p postgres -c "postgres -c 'config_file=/config/postgresql.conf'; tail -F anything"
