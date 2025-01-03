FROM quay.io/keycloak/keycloak:26.0.7

COPY realm-config/keycloak-health-check.sh /opt/keycloak/health-check.sh
RUN chmod +x /opt/keycloak/health-check.sh

EXPOSE 9080 9443 9990
