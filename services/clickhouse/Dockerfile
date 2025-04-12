FROM clickhouse/clickhouse-server:23.3

# The base image usually already has 'clickhouse' user set up
# but let's ensure directories are owned by clickhouse:
USER root
RUN chown -R clickhouse:clickhouse /var/lib/clickhouse /var/log/clickhouse-server

# If you remove config.d stuff, that's fine:
RUN rm -f /etc/clickhouse-server/config.d/*.xml

COPY zzz-logger.xml /etc/clickhouse-server/config.d/

# Switch to clickhouse user from here on:
USER clickhouse

COPY entrypoint.sh /entrypoint.sh
# We might need to ensure this script is executable by 'clickhouse' 
RUN chmod +x /entrypoint.sh

ENV CLICKHOUSE_DO_NOT_REINIT_CONFIG=1

ENTRYPOINT ["/entrypoint.sh"]