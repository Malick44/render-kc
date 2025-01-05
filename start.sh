#!/bin/bash
cd /opt/keycloak

# Start Keycloak in HTTP mode and import realm
/opt/keycloak/bin/kc.sh start \
    -- optimized
    --hostname="0.0.0.0" \
    --http-relative-path="/auth" \
    --http-port=8080 \
    --http-enabled=true \
    --spi-cluster-jgroups-stack=kubernetes \
    # --import-realm --realm-file=/opt/keycloak/realm.json \
    --hostname="${KEYCLOAK_HOSTNAME_URL}" \
    --hostname-strict=false
