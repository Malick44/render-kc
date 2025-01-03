FROM quay.io/keycloak/keycloak:26.0.7 as builder

#Enable extensions dir
ENV KC_EXTENSIONS_DIR=/opt/keycloak/providers

#Add extensions (if any)
#COPY target/keycloak-extensions/*.jar  ${KC_EXTENSIONS_DIR}

WORKDIR /opt/keycloak

ENV KC_DB=postgres
ENV KC_HEALTH_ENABLED=true
RUN /opt/keycloak/bin/kc.sh build


FROM quay.io/keycloak/keycloak:26.0.7
COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY ./realm-config /opt/keycloak/data/import/
EXPOSE 8080
USER root
COPY ./start.sh /opt/keycloak/
RUN chmod +x /opt/keycloak/start.sh
USER 1000
ENTRYPOINT ["/opt/keycloak/start.sh"]
