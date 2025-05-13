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
ENV KC_SPI_THEME_DEFAULT=modern-theme
ENV KC_SPI_THEME_WELCOME_THEME=modern-theme
ENV KC_SPI_THEME_CACHE_THEMES=false
ENV KC_SPI_THEME_CACHE_TEMPLATES=false
ENV KC_SPI_THEME_STATIC_MAX_AGE=-1

# Copy custom theme files
COPY themes/modern-theme /opt/keycloak/themes/modern-theme

COPY start.sh .
USER root
RUN chmod +x start.sh
USER 1000

EXPOSE 8080
ENTRYPOINT ["./start.sh"]
