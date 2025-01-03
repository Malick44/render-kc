#!/bin/bash
/opt/keycloak/bin/kc.sh start --db-url="${DATABASE_URL}" --db-username="${DB_USERNAME}" --db-password="${DB_PASSWORD}" --hostname="0.0.0.0"  --http-relative-path="/auth" --http-port=8080 --hostname-url="${KEYCLOAK_HOSTNAME_URL}"
