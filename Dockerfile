FROM quay.io/keycloak/keycloak:26.0.7 as builder


RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.0.7
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8080

COPY start.sh .
USER root
RUN chmod +x start.sh
USER 1000

EXPOSE 8080
ENTRYPOINT ["./start.sh"]
