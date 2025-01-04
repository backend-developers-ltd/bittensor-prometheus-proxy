#!/bin/bash
# shellcheck disable=SC2034
[ "$1" != "staging" ] && [ "$1" != "prod" ] &&  echo "Please provide environment name to deploy: staging or prod" && exit 1;

PROJECT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../../

if [ "$1" == "staging" ]; then
    APP_SUFFIX="-staging"
else
    APP_SUFFIX=""
fi

IMAGE_NAME="backenddevelopersltd/bittensor-prometheus-proxy${APP_SUFFIX}"