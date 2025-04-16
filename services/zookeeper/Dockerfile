# services/zookeeper/Dockerfile
FROM bitnami/zookeeper:3.7.1

# The snippet in your Docker Compose had "user: root", so do the same:
USER root

# Apply the same labels from your snippet.
LABEL signoz.io/scrape="true"
LABEL signoz.io/port="9141"
LABEL signoz.io/path="/metrics"

# Set environment variables just like the Compose snippet
ENV ZOO_SERVER_ID=1
ENV ALLOW_ANONYMOUS_LOGIN=yes
ENV ZOO_AUTOPURGE_INTERVAL=1
ENV ZOO_ENABLE_PROMETHEUS_METRICS=yes
ENV ZOO_PROMETHEUS_METRICS_PORT_NUMBER=9141

# Add the same HEALTHCHECK the snippet used.
# Docker syntax for a healthcheck: HEALTHCHECK [options] CMD <command> 
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD \
  curl -s -m 2 http://localhost:8080/commands/ruok | grep error | grep null || exit 1

# Expose ports if you want them for local debugging (not strictly necessary on Railway).
#   2181 - ZK client port
#   2888 - follower connections
#   3888 - leader election
#   9141 - optional metrics port if enabled
EXPOSE 2181 2888 3888 9141

# Bitnami ZooKeeper typically uses this as its default entrypoint,
# but we'll be explicit to show what's happening.
CMD [ "/opt/bitnami/scripts/zookeeper/run.sh" ]
