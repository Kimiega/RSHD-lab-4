#!/usr/bin/sh

set -e

cd "$(dirname "$0")"

sql() {
    DDB_PG_USER="postgres"
    DDB_PG_PORT="9999"
    DDB_DATABASE="postgres"
    export PGPASSWORD="password"
    psql -U "$DDB_PG_USER" -h localhost -p $DDB_PG_PORT -c "$1" $DDB_DATABASE
}

worker() {
    ID="$1"
    TABLE="worker_${ID}_note"

    echo "[client#$ID] Starting worker..."

    echo "[client#$ID] Creating table '$TABLE'..."
    sql "CREATE TABLE $TABLE (id serial PRIMARY KEY, content text NOT NULL);"

    for j in $(seq 2 8); do
        echo "[client#$ID] Inserting into '$TABLE'..."    
        sql "INSERT INTO $TABLE (content) VALUES ('Another row at $TABLE');" &
        sleep 1s
    done

    echo "[client#$ID] Done!"
}

for i in $(seq 1 8); do
    worker "$i" &
done
