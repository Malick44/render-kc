#!/bin/bash
cd /opt/keycloak

/opt/keycloak/bin/kc.sh start \
    --optimized \
    --http-enabled=true \
    --hostname-strict=false \
    --hostname-url=https://render-kc-gdz6.onrender.com/auth \
    --hostname-admin-url=https://render-kc-gdz6.onrender.com/auth
