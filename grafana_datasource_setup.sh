#!/bin/bash

# Create InfluxDB data source
curl -X POST "${GRAFANA_URL}/api/datasources" \
    -H "Authorization: Bearer ${GRAFANA_API_KEY}" \
    -H "Content-Type: application/json" \
    --data '{
        "name": "InfluxDB",
        "type": "influxdb",
        "access": "proxy",
        "url": "http://'${INFLUXDB_SERVER_IP}':8086",
        "database": "'${INFLUXDB_DATABASE}'",
        "user": "'${INFLUXDB_USER}'",
        "password": "'${INFLUXDB_PASSWORD}'"
    }'
