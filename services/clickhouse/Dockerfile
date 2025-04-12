FROM clickhouse/clickhouse-server:23.3

# 1) Copy files & ensure they're executable
COPY entrypoint.sh /entrypoint.sh
COPY zzz-logger.xml /etc/clickhouse-server/config.d/

RUN chmod +x /entrypoint.sh

# 2) Now remove any .xml
RUN rm -f /etc/clickhouse-server/config.d/*.xml

# 3) Then place your zzz-logger.xml again if you prefer
# (or reorder your steps as needed)
COPY zzz-logger.xml /etc/clickhouse-server/config.d/

# 4) chown data dirs
RUN chown -R clickhouse:clickhouse /var/lib/clickhouse /var/log/clickhouse-server

ENV CLICKHOUSE_DO_NOT_REINIT_CONFIG=1

USER clickhouse
ENTRYPOINT ["/entrypoint.sh"]