#!/usr/bin/sh

set -e

export DDB_PG_USER="postgres"
export DDB_PG_PORT="7777"
export DDB_DATABASE="postgres"
export PGPASSWORD="password"

psql -U "$DDB_PG_USER" -h localhost -p $DDB_PG_PORT $DDB_DATABASE
