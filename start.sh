#!/bin/bash

# Start Keycloak, using environment variables
/opt/keycloak/bin/kc.sh start \
    --hostname="0.0.0.0" \
    --http-relative-path="/auth" \
    --http-port=8080 \
    --hostname-url="${KEYCLOAK_HOSTNAME_URL}"
