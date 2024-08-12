#!/bin/sh

ADMIN_EMAIL=${MB_ADMIN_EMAIL:-admin@metabase.local}
ADMIN_PASSWORD=${MB_ADMIN_PASSWORD:-example1234}

METABASE_HOST=${MB_HOSTNAME}
METABASE_PORT=${MB_PORT:-3000}

echo "⌚︎ Waiting for Metabase to start"
while (! curl -s -m 5 http://${METABASE_HOST}:${METABASE_PORT}/api/session/properties -o /dev/null); do sleep 5; done

echo "😎 Creating admin user"

# https://www.metabase.com/docs/latest/api/api-key
# curl -s -X POST \
#     -H "Content-type: application/json" \
#     -H 'x-api-key: YOUR_API_KEY' \
#      http://${METABASE_HOST}:${METABASE_PORT}/api/database \
#     -d '{
#         "engine": "redshift",
#         "name": "Redshift",
#         "details": {
#             "host": "redshift.aws.com",
#             "port": "5432",
#             "db": "dev",
#             "user": "root",
#             "password": "password"
#         }
#     }'

echo -e "\n Database connected!"