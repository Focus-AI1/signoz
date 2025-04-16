#FROM signoz/signoz-otel-collector:v0.9.3
FROM signoz/signoz-otel-collector:v0.111.39
#FROM signoz/signoz-otel-collector:latest

# The official collector container typically expects a config at /etc/otel-collector-config.yaml
COPY --chmod=0755 otel-collector-config.yaml /etc/otel-collector-config.yaml

EXPOSE 4317
# EXPOSE 4318 # if you want OTLP/HTTP

ENV LOW_CARDINAL_EXCEPTION_GROUPING=true

CMD [ "--config=/etc/otel-collector-config.yaml" ]
