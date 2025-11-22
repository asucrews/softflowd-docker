FROM alpine:3.20

# Install softflowd (or whatever tool your add-on runs)
RUN apk add --no-cache softflowd bash

# Create a non-root user (optional but nice)
RUN addgroup -S softflowd && adduser -S softflowd -G softflowd

WORKDIR /app

# Copy entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

USER softflowd

# Default env (can be overridden by docker run / compose)
ENV NETFLOW_COLLECTOR="127.0.0.1:2055" \
    NETFLOW_IFACE="eth0" \
    NETFLOW_VERSION="9" \
    NETFLOW_OPTIONS=""

ENTRYPOINT ["/app/entrypoint.sh"]
