# Dockerfile

# --- Stage 1: Build Keycloak
FROM  quay.io/keycloak/keycloak:latest AS build

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure database
ENV KC_DB=postgres
ENV KC_DB_URL="jdbc:postgresql://c67okggoj39697.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d7soqlidsno04j"
ENV KC_DB_USERNAME="u6kj4e3i1rcjlr"
ENV KC_DB_PASSWORD="p96b27cb2e2cbaaf0d94d18ec3d764fa3034a871353ba86f07536e437c8a00001"

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

# --- Stage 2: Final Image
FROM  quay.io/keycloak/keycloak:latest

# Copy from the build stage
COPY --from=build /opt/keycloak/ /opt/keycloak/

# Required Heroku config
ENV PORT=8080
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
EXPOSE 8080
ENV PROXY_ADDRESS_FORWARDING=true


ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
