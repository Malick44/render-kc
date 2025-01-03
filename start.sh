#!/bin/bash

# Start Keycloak in HTTP mode and import realm
/opt/keycloak/bin/kc.sh start \
    --hostname="0.0.0.0" \
    --http-relative-path="/auth" \
    --http-port=8080 \
    --hostname-url="${KEYCLOAK_HOSTNAME_URL}"  \
    --http-enabled=true \
    --spi-cluster-jgroups-stack=kubernetes \
    --import-realm --realm-file=/opt/keycloak/realm.json
