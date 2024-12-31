FROM quay.io/keycloak/keycloak:26.0.7 as builder

# Configure Keycloak
ENV KC_DB=postgres
ENV KC_FEATURES=scripts
ENV KC_HEALTH_ENABLED=true
ENV KC_TRANSACTION_XA_ENABLED=false
ENV KC_CACHE=enabled
ENV KC_CACHE_STACK=local
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false

# Copy cache configuration
COPY realm-config/cache-ispn.xml /opt/keycloak/conf/cache-ispn.xml

# Build optimized
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.0.7
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

# Use port from Heroku environment variable
CMD export KC_HTTP_PORT=${PORT:-8080} && \
    /opt/keycloak/bin/kc.sh start-dev \
    --http-enabled=true \
    --hostname-strict=false \
    --proxy=edge \
    --db-url=${DATABASE_URL} \
    --db-username=${DB_USER} \
    --db-password=${DB_PASSWORD}
