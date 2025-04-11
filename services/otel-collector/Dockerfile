# File: services/otel-collector/Dockerfile
FROM signoz/signoz-otel-collector:v0.9.3

# The official collector container typically expects a config at /etc/otel-collector-config.yaml
COPY otel-collector-config.yaml /etc/otel-collector-config.yaml

EXPOSE 4317   # gRPC ingestion
# EXPOSE 4318 # if you want OTLP/HTTP

CMD [ "--config=/etc/otel-collector-config.yaml" ]