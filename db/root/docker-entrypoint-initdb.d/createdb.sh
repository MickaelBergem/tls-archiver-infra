#!/bin/bash
set -e
#
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" "$POSTGRES_DB" <<-EOSQL
#     CREATE USER archiver;
#     CREATE DATABASE archives;
#     GRANT ALL PRIVILEGES ON DATABASE archives TO archiver;
# EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" "$POSTGRES_DB" -f /initdb.sql
