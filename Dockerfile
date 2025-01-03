FROM quay.io/keycloak/keycloak:26.0.7

COPY realm-config/keycloak-health-check.sh /opt/keycloak/health-check.sh
COPY --chmod=755 realm-config/keycloak-health-check.sh /opt/keycloak/health-check.sh


EXPOSE 9080 9443 9990
