# File: services/signoz/Dockerfile
#FROM signoz/signoz:v0.9.3
#FROM signoz/signoz:v0.78.1
FROM signoz/signoz:v0.79.0

# Copy additional configs, e.g. custom prometheus config or any override
#COPY config/prometheus.yml /root/config/prometheus.yml
COPY prometheus.yml /root/config/prometheus.yml

# Expose port 8080 for UI + backend
EXPOSE 8080

# SigNoz uses environment variables for config. 
# We'll rely on them at runtime rather than baking them here.
# The default entrypoint from the official image runs the `signoz` binary.

# If you do want a custom entrypoint to wait for ClickHouse or run migrations, 
# you can override it, e.g.:
# COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]
