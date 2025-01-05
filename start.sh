#!/bin/bash
cd /opt/keycloak

/opt/keycloak/bin/kc.sh start \
    --optimized \
    --db-url-database=postgres \
    --http-enabled=true \
    --hostname-strict=false \
    --proxy-headers=xforwarded \
    --db-url-port="25256" \
    --hostname="${KC_HOSTNAME}" \
    --db-url="${KC_DB_URL}" \
    --db-username="${KC_DB_USERNAME}" \
    --db-password="${KC_DB_PASSWORD}" \

