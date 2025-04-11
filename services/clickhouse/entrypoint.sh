#!/usr/bin/env bash

# Example script to handle first-run tasks or custom function setup.

set -e

# If you have a separate copy of the histogram UDF in the image, place it
# in /var/lib/clickhouse/user_scripts if it's missing (volume might be empty).
# if [ ! -f /var/lib/clickhouse/user_scripts/libclickhouse_functions_udf.so ]; then
#   echo "Copying custom UDF..."
#   mkdir -p /var/lib/clickhouse/user_scripts
  # cp /usr/local/bin/libclickhouse_functions_udf.so /var/lib/clickhouse/user_scripts/
# fi

# If the histogram aggregator is not present, download it
if [ ! -f "/var/lib/clickhouse/user_scripts/histogramQuantile" ]; then
  echo "Installing histogramQuantile aggregator..."
  version="v0.0.1"
  node_os=$(uname -s | tr '[:upper:]' '[:lower:]')
  node_arch=$(uname -m | sed s/aarch64/arm64/ | sed s/x86_64/amd64/)

  mkdir -p /tmp/histogram-install
  cd /tmp/histogram-install

  # Use wget in your Alpine-based container
  wget -O histogram-quantile.tar.gz \
    "https://github.com/SigNoz/signoz/releases/download/histogram-quantile%2F${version}/histogram-quantile_${node_os}_${node_arch}.tar.gz"

  tar -xzf histogram-quantile.tar.gz
  chmod +x histogram-quantile

  mkdir -p /var/lib/clickhouse/user_scripts
  mv histogram-quantile /var/lib/clickhouse/user_scripts/histogramQuantile

  echo "histogramQuantile aggregator installed"
fi


# Finally, start the official clickhouse-server entrypoint
exec /usr/bin/clickhouse-server --config-file=/etc/clickhouse-server/config.xml
