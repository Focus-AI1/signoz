FROM clickhouse/clickhouse-server:23.3

USER root

# delete existing config biznass1
RUN rm /etc/clickhouse-server/config.xml || true
RUN rm -f /etc/clickhouse-server/config.d/*.xml

# remove/rename entrypoint (i don't really get the usefulness of this, but whatever)
RUN mv /entrypoint.sh /entrypoint.sh.bak || true
RUN mv /usr/bin/entrypoint.sh /usr/bin/entrypoint.sh.bak || true

# copy your minimal config.xml in place of the default
#COPY my-minimal-config.xml /etc/clickhouse-server/config.xml

COPY zzz-logger.xml /etc/clickhouse-server/config.xml
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN chown -R clickhouse:clickhouse /var/lib/clickhouse /var/log/clickhouse-server /entrypoint.sh /
USER clickhouse

ENV CLICKHOUSE_DO_NOT_REINIT_CONFIG=1
ENTRYPOINT ["/entrypoint.sh"]


#RUN chown -R clickhouse:clickhouse /var/lib/clickhouse /var/log/clickhouse-server
#RUN echo 'running chown'
#RUN mkdir -p /var/lib/clickhouse /var/lib/clickhouse/tmp
#RUN chown -R clickhouse:clickhouse /var/lib/clickhouse


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
