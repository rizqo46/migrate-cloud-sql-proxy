# Use alpine as the base image
FROM alpine:latest

# Install curl
RUN apk --no-cache add curl

# Download and install cloud-sql-proxy
ARG CLOUD_SQL_PROXY_VERSION="v2.8.1"
RUN curl -L "https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/${CLOUD_SQL_PROXY_VERSION}/cloud-sql-proxy.linux.amd64" -o /usr/local/bin/cloud-sql-proxy \
    && chmod +x /usr/local/bin/cloud-sql-proxy

# Use migrate/migrate as the base image
FROM migrate/migrate:latest
COPY --from=0 /usr/local/bin/cloud-sql-proxy /usr/local/bin/cloud-sql-proxy
RUN apk --no-cache add curl

# Set the entrypoint for the migrate/migrate image
ENTRYPOINT [""]