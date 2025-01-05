#!/bin/bash
cd /opt/keycloak

/opt/keycloak/bin/kc.sh start \
    --optimized \
    --http-enabled=true \
    --hostname-strict=false \
    --hostname="render-kc-gdz6.onrender.com" \
    --db=postgres \
    --db-url="jdbc:postgresql://roundhouse.proxy.rlwy.net:25256/railway" \
    --db-username="postgres" \
    --db-password="DtuPFvzJPWTuGPZBTUCdIePiAXImqxPT"
