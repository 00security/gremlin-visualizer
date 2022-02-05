#!/bin/sh
set -ex
echo "SERVER_URL: ${SERVER_URL}"
ESCAPED_URL=$(printf '%s' "$SERVER_URL" | sed -e 's/[\/&]/\\&/g')
sed -i "s/__SERVER_URL__/${ESCAPED_URL}/g" src/constants.js

if [ -z ${DEFAULT_HOST} ]; then
  export DEFAULT_HOST="localhost"
fi
echo "DEFAULT_HOST: ${DEFAULT_HOST}"
ESCAPED_HOST=$(printf '%s' "$DEFAULT_HOST" | sed -e 's/[\/&]/\\&/g')
sed -i "s/__DEFAULT_HOST__/${ESCAPED_HOST}/g" src/constants.js

if [ -z ${DEFAULT_PORT} ]; then
  export DEFAULT_PORT="8182"
fi
echo "DEFAULT_PORT: ${DEFAULT_PORT}"
sed -i "s/__DEFAULT_PORT__/${DEFAULT_PORT}/g" src/constants.js

npm start 