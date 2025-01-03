FROM quay.io/keycloak/keycloak:26.0.7 as builder

ENV KC_DB=postgres
ENV KC_HEALTH_ENABLED=true
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.0.7
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
COPY start.sh .
COPY realm-config/realm.json data/import/
RUN chmod +x start.sh

EXPOSE 8080
ENTRYPOINT ["./start.sh"]
