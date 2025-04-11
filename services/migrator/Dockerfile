# File: services/migrator/Dockerfile
FROM signoz/signoz-schema-migrator:v0.9.3

COPY run-migrations.sh /run-migrations.sh
RUN chmod +x /run-migrations.sh

# Default command will just run the script
ENTRYPOINT ["/run-migrations.sh"]