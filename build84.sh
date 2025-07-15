#!/usr/bin/env bash

docker buildx build --pull --push --build-arg FRANKEN_VERSION=1.8 --build-arg PHP_VERSION=8.4 --platform=linux/amd64,linux/arm64/v8 --tag rpungello/laravel-franken:8.4 --tag rpungello/laravel-franken:latest --tag 692057070962.dkr.ecr.us-east-1.amazonaws.com/laravel-franken:8.4 --tag 692057070962.dkr.ecr.us-east-1.amazonaws.com/laravel-franken:latest .
