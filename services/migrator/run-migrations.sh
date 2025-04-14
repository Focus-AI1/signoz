#!/usr/bin/env bash
set -e

echo "Starting schema migration..."
# Provide environment like CLICKHOUSE_HOST, CLICKHOUSE_PORT, etc.
# or pass DSN (depending on the migrator's usage)

# For example:
# signoz-schema-migrator --db_host=$CLICKHOUSE_HOST --db_port=$CLICKHOUSE_PORT --mode=sync
# signoz-schema-migrator --db_host=$CLICKHOUSE_HOST --db_port=$CLICKHOUSE_PORT --mode=async

# As an example (might differ by SigNoz version):
echo "running migrator on clickhouse host $CLICKHOUSE_HOST : port $CLICKHOUSE_PORT"
#/app/schema-migrator sync --dsn=tcp://clickhouse.railway.internal:9000 --mode=sync --db_host=$CLICKHOUSE_HOST --db_port=$CLICKHOUSE_PORT
/schema-migrator sync --dsn=tcp://${CLICKHOUSE_HOST}:${CLICKHOUSE_PORT} --up=
#/app/schema-migrator --mode=async

echo "Migrations completed."

# Sleep forever so the container won't exit and cause Railway to restart it
tail -f /dev/null
