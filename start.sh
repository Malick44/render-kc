#!/bin/bash

# Use the provided JDBC URL as is
DB_JDBC_URL="${DATABASE_URL}"
DB_USERNAME="${DB_USERNAME}"
DB_PASSWORD="${DB_PASSWORD}"

# Start Keycloak, using extracted values
/opt/keycloak/bin/kc.sh start \
    --db-url="$DB_JDBC_URL" \
    --db-username="$DB_USERNAME" \
    --db-password="$DB_PASSWORD" \
    --hostname="0.0.0.0" \
    --http-relative-path="/auth" \
    --http-port=8080 \
    --hostname-url="${KEYCLOAK_HOSTNAME_URL}"
