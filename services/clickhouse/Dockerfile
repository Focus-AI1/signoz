FROM clickhouse/clickhouse-server:23.3

COPY config.xml /etc/clickhouse-server/config.xml
COPY users.xml /etc/clickhouse-server/users.xml
#COPY clusters.xml /etc/clickhouse-server/clusters.xml
COPY cluster.xml /etc/clickhouse-server/cluster.xml

# download UDF binary from SigNoz's source. Shown here as a reference:
# RUN mkdir -p /var/lib/clickhouse/user_scripts && \
#   wget -O /usr/local/bin/libclickhouse_functions_udf.so \
#   curl -SL -o /usr/local/bin/libclickhouse_functions_udf.so \
#   https://github.com/<somewhere>/histogramQuantile-binary.so

# Copy an entrypoint script that ensures the UDF is placed on the volume 
# if needed
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000 8123
ENTRYPOINT ["/entrypoint.sh"]
