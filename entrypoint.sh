#!/bin/bash
set -e

cd /app

if [ -n "${APP_NAME}" ] && [ -n "${APP_VERSION}" ]; then
	echo "Starting $APP_NAME v$APP_VERSION"
elif [ -n "${APP_NAME}" ]; then
	echo "Starting $APP_NAME"
fi

# If this is the first time the container is being run, build the frontend assets. This cannot be done ahead of time because frontend assets include environment-specific information (such as Pusher keys)
if [ ! -d "/app/public/build" ] || [ "$REBUILD" = "true" ]; then
	npm run build
fi

if [ "$RUN_MIGRATIONS" = "true" ]; then
	php artisan migrate --force --isolated
fi

# Optimize the installation
echo "Optimizing Laravel"
php artisan optimize

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- frankenphp run "$@"
fi

exec "$@"
