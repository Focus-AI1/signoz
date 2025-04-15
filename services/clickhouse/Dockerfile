FROM clickhouse/clickhouse-server:23.3

USER root
RUN rm /etc/clickhouse-server/config.xml || true
# copy your minimal config.xml in place of the default
#COPY my-minimal-config.xml /etc/clickhouse-server/config.xml

# Or remove if you want to do everything from /config.d. 
RUN rm /etc/clickhouse-server/config.d/docker_related_config.xml || true
#COPY zzz-logger.xml /etc/clickhouse-server/config.d/zzz-logger.xml
COPY zzz-logger.xml /etc/clickhouse-server/config.xml

ENV CLICKHOUSE_DO_NOT_REINIT_CONFIG=1
USER clickhouse
ENTRYPOINT ["/entrypoint.sh"]


#FROM clickhouse/clickhouse-server:23.3

# 1) Copy files & ensure they're executable
#COPY entrypoint.sh /entrypoint.sh
#COPY zzz-logger.xml /etc/clickhouse-server/config.d/

#RUN chmod +x /entrypoint.sh

# 2) Now remove any .xml
#RUN rm -f /etc/clickhouse-server/config.d/*.xml

# 3) Then place your zzz-logger.xml again if you prefer
# (or reorder your steps as needed)
#COPY zzz-logger.xml /etc/clickhouse-server/config.d/

# 4) chown data dirs
#RUN chown -R clickhouse:clickhouse /var/lib/clickhouse /var/log/clickhouse-server

#ENV CLICKHOUSE_DO_NOT_REINIT_CONFIG=1

#USER clickhouse
#ENTRYPOINT ["/entrypoint.sh"]
