#!/bin/bash
set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

if [[ $USE_DB = "true" ]]; then
  bundle exec rails db:prepare
fi

exec "$@"
