# deploy_keycloak.sh

#!/bin/bash

RENDER_API_KEY=$1

curl -X POST "https://api.render.com/v1/services" \
     -H "Authorization: Bearer ${RENDER_API_KEY}" \
     -H "Content-Type: application/json" \
     -d '{
           "name": "keycloak-service",
           "serviceDetails": {
             "type": "web",
             "env": "docker",
             "region": "o2",
             "plan": "starter",
             "dockerCommand": "start-keycloak.sh",
             "dockerfilePath": "./Dockerfile",
             "envVars": [
               {
                 "key": "KEYCLOAK_USER",
                 "value": "admin"
               },
               {
                 "key": "KEYCLOAK_PASSWORD",
                 "value": "your_secure_password"
               }
             ]
           }
         }'
