FROM quay.io/keycloak/keycloak:26.0.7 as builder

# Configure postgres and cache
ENV KC_DB=postgres
ENV KC_DB_URL="jdbc:postgresql://c67okggoj39697.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d7soqlidsno04j"
ENV KC_DB_USERNAME="u6kj4e3i1rcjlr"
ENV KC_DB_PASSWORD="p96b27cb2e2cbaaf0d94d18ec3d764fa3034a871353ba86f07536e437c8a00001"
ENV KC_FEATURES=scripts
ENV KC_HEALTH_ENABLED=true
ENV KC_TRANSACTION_XA_ENABLED=false
ENV KC_DB_SCHEMA=ke
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge
ENV KC_CACHE=enabled
ENV KC_CACHE_STACK=local
ENV PROXY_ADDRESS_FORWARDING=true

# Copy cache configuration
COPY realm-config/cache-ispn.xml /opt/keycloak/conf/cache-ispn.xml

# Build keycloak with custom configurations
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.0.7
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

# Set PostgreSQL as default database
ENV KC_DB=postgres
