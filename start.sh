#!/bin/bash
cd /opt/keycloak

# Start Keycloak in HTTP mode
/opt/keycloak/bin/kc.sh start \
    --optimized \
    --hostname="${KC_HOSTNAME}" \
    # --http-relative-path=/auth \
    --http-port=8080 \
    --http-enabled=true \
    --proxy=edge \
    --hostname-strict=false
