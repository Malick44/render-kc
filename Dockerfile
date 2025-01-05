FROM quay.io/keycloak/keycloak:22.0.3 as builder

# Build the optimized version with required features
RUN /opt/keycloak/bin/kc.sh build \
    --db=postgres \
    --health-enabled=true \
    --metrics-enabled=true

FROM quay.io/keycloak/keycloak:22.0.3
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

# Environment variables
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8080

COPY start.sh .
USER root
RUN chmod +x start.sh
USER 1000

EXPOSE 8080
ENTRYPOINT ["./start.sh"]
