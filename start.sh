#!/bin/bash
set -e

/opt/keycloak/bin/kc.sh start \
    --optimized \
    --proxy edge \
    --db postgres \
    --db-url "${KC_DB_URL}" \
    --db-username "${KC_DB_USERNAME}" \
    --db-password "${KC_DB_PASSWORD}" \
    --http-enabled=true \
    --http-port=8080 \
    --import-realm
