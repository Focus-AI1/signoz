#!/usr/bin/env bash
# File: services/migrator/run-migrations.sh
set -e

echo "Starting schema migration..."
# Provide environment like CLICKHOUSE_HOST, CLICKHOUSE_PORT, etc.
# or pass DSN (depending on the migrator's usage)

# For example:
# signoz-schema-migrator --db_host=$CLICKHOUSE_HOST --db_port=$CLICKHOUSE_PORT --mode=sync
# signoz-schema-migrator --db_host=$CLICKHOUSE_HOST --db_port=$CLICKHOUSE_PORT --mode=async

# As an example (might differ by SigNoz version):
/app/schema-migrator --mode=sync
/app/schema-migrator --mode=async

echo "Migrations completed."

# Sleep forever so the container won't exit and cause Railway to restart it
tail -f /dev/null