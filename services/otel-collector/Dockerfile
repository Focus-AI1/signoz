#FROM signoz/signoz-otel-collector:v0.9.3
FROM signoz/signoz-otel-collector:v0.111.38

# The official collector container typically expects a config at /etc/otel-collector-config.yaml
COPY otel-collector-config.yaml /etc/otel-collector-config.yaml

EXPOSE 4317
# EXPOSE 4318 # if you want OTLP/HTTP

ENV LOW_CARDINAL_EXCEPTION_GROUPING=true

CMD [ "--config=/etc/otel-collector-config.yaml" ]
