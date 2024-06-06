#!/usr/bin/sh

echo "Checking for an available standby..."
pg_isready \
    --host="standby" \
    --port="5432" \
    --username="postgres" \
    --dbname="postgres" \
    --quiet

if [ "$?" = "0" ]; then
    echo "Found available standby. Starting rewind..."
    su -p postgres -c "pg_rewind \
        --config-file=/data/postgres/postgresql.conf \
        --source-server='host=standby user=postgres password=password' \
        --target-pgdata=/data/postgres"
else
    echo "Available standby was not found. Starting initialization..."

    mkdir -p "$PGDATA" &&
        chown -R postgres:postgres "$PGDATA" &&
        chmod 700 "$PGDATA"

    echo "password" >/password.txt &&
        chown -R postgres:postgres password.txt &&
        chmod 700 password.txt

    su -p postgres -c "initdb \
        --pgdata="$PGDATA" \
        --auth-host=md5 \
        --pwfile=/password.txt"

    echo "host all all all md5" >>$PGDATA/pg_hba.conf
    echo "host replication all all md5" >>$PGDATA/pg_hba.conf

    cp /config/postgresql.conf $PGDATA/postgresql.conf
fi

echo "Starting postgres..."
su -p postgres -c "postgres"
