FROM quay.io/keycloak/keycloak:26.2.0 as builder

# Build the optimized version with required features
RUN /opt/keycloak/bin/kc.sh build \
    --db=postgres \
    --health-enabled=true \
    --metrics-enabled=true

FROM quay.io/keycloak/keycloak:26.0.7
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

# Environment variables
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8080
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

COPY start.sh .
USER root
RUN chmod +x start.sh
USER 1000

EXPOSE 8080
ENTRYPOINT ["./start.sh"]
