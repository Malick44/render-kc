FROM quay.io/keycloak/keycloak:22.0.5 as builder

#Enable extensions dir
#ENV KC_EXTENSIONS_DIR=/opt/keycloak/providers

#Add extensions (if any)
#COPY target/keycloak-extensions/*.jar  ${KC_EXTENSIONS_DIR}

WORKDIR /opt/keycloak

RUN /opt/keycloak/bin/kc.sh build


FROM quay.io/keycloak/keycloak:22.0.5
ENV KC_HEALTH_ENABLED=true
COPY --from=builder /opt/keycloak/ /opt/keycloak/

EXPOSE 8080
USER root
COPY ./start.sh /opt/keycloak/
RUN chmod +x /opt/keycloak/start.sh
USER 1000
CMD ["/bin/bash", "-c", "cd /opt/keycloak && /opt/keycloak/start.sh"]
