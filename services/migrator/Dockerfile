#FROM signoz/signoz-schema-migrator:v0.9.3
FROM signoz/signoz-schema-migrator:v0.111.38

COPY --chmod=0755 run-migrations.sh /run-migrations.sh
#RUN chmod +x /run-migrations.sh

ENV CLICKHOUSE_HOST=clickhouse.railway.internal
#ENV CLICKHOUSE_HOST=clickhouse
#ENV CLICKHOUSE_HOST=clickhouse-development-6360.up.railway.app
ENV CLICKHOUSE_PORT=9000


# Default command will just run the script
ENTRYPOINT ["/run-migrations.sh"]
