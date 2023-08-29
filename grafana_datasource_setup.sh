#!/bin/bash

GRAFANA_URL="http://your_server_ip:3000"
GRAFANA_API_KEY="your_grafana_api_key"

# Create InfluxDB data source
curl -X POST "${GRAFANA_URL}/api/datasources" \
     -H "Authorization: Bearer ${GRAFANA_API_KEY}" \
     -H "Content-Type: application/json" \
     --data '{
         "name": "InfluxDB",
         "type": "influxdb",
         "access": "proxy",
         "url": "http://192.168.1.253:8086",
         "database": "tekno-pathshala",
         "user": "tekno",
         "password": "password@12"
     }'
