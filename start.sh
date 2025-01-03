#!/bin/bash
cd /opt/keycloak
echo "KC_BOOTSTRAP_ADMIN_USERNAME is '$KC_BOOTSTRAP_ADMIN_USERNAME'"
echo "KC_BOOTSTRAP_ADMIN_PASSWORD is '$KC_BOOTSTRAP_ADMIN_PASSWORD'"


# Start Keycloak in HTTP mode and import realm
/opt/keycloak/bin/kc.sh start \
    --hostname="0.0.0.0" \
    --http-relative-path="/auth" \
    --http-port=8080 \
    --http-enabled=true \
    --spi-cluster-jgroups-stack=kubernetes \
    --import-realm --realm-file=/opt/keycloak/realm.json
