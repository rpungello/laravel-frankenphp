# Laravel FrankenPHP

This image takes the standard FrankenPHP one and adds a few nicities that make running Laravel apps nicer. These include:

## PHP Extensions
The following PHP extensions are included
- ftp
- gd
- imagick
- intl
- mongodb
- opcache
- pdo_mysql
- redis
- zip

## Composer
The latest version of `composer` is included as `/usr/bin/composer`

## NodeJS / NPM
NodeJS 22.x is included

## Entrypoint
A custom entrypoint is included that performs a few Laravel-specific tasks before starting up the primary FrankenPHP process
1. Displays the app name & version when starting up (useful for verifying which version is running)
2. Runs `npm run build` if the `public/build` directory is not present, or if the `REBUILD` env variable is `true`.
3. Runs `php artisan migrate --force --isolated` if the `RUN_MIGRATIONS` env variable is `true` (`--force` is used to allow it to run non-interactively, `--isolated` is used so if there are multiple app servers, only one handles the migrations)
4. Runs `php artisan optimize` to improve app performance
