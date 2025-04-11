#!/usr/bin/env bash

# Example script to handle first-run tasks or custom function setup.

set -e

# If you have a separate copy of the histogram UDF in the image, place it
# in /var/lib/clickhouse/user_scripts if it's missing (volume might be empty).
if [ ! -f /var/lib/clickhouse/user_scripts/libclickhouse_functions_udf.so ]; then
  echo "Copying custom UDF..."
  mkdir -p /var/lib/clickhouse/user_scripts
  # cp /usr/local/bin/libclickhouse_functions_udf.so /var/lib/clickhouse/user_scripts/
fi

# Finally, start the official clickhouse-server entrypoint
exec /usr/bin/clickhouse-server --config-file=/etc/clickhouse-server/config.xml
