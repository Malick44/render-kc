# Dockerfile

# --- Stage 1: Build Keycloak
FROM  quay.io/keycloak/keycloak:latest AS build

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

# --- Stage 2: Final Image
FROM  quay.io/keycloak/keycloak:latest

# Copy from the build stage
COPY --from=build /opt/keycloak/ /opt/keycloak/

# Required Heroku config
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_PASSWORD=admin
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
EXPOSE 8080
ENV PROXY_ADDRESS_FORWARDING=true

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
