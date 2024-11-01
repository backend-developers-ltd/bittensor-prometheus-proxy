#!/bin/bash
set -xe

THIS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$THIS_DIR"/vars.sh

cd "$PROJECT_DIR"/app

echo "Deploying Backend: ${APP_NAME}"
docker push "${IMAGE_NAME}":latest

