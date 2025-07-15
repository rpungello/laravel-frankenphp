#!/usr/bin/env bash

docker buildx build --pull --push --build-arg PHP_VERSION=8.2 --platform=linux/amd64,linux/arm64/v8 --tag rpungello/laravel-franken:8.2 --tag 692057070962.dkr.ecr.us-east-1.amazonaws.com/laravel-franken:8.2 .
