#!/bin/bash
cd /opt/keycloak

/opt/keycloak/bin/kc.sh start \
    --optimized \
    --http-enabled=true \
    --hostname-strict=false \
    --proxy-headers=xforwarded \
    --hostname="https://render-kc-gdz6.onrender.com" \
    --db-url-database=postgres \
    --db-url-port="25256" \
    --db-url="jdbc:postgresql://roundhouse.proxy.rlwy.net:25256/railway" \
    --db-username="postgres" \
    --db-password="DtuPFvzJPWTuGPZBTUCdIePiAXImqxPT"

