#!/bin/bash

CONTAINER_NAME=cypress
CYPRESS_VERSION=7.4.0

# print command before running
set -x
# pull image
docker pull cypress/included:${CYPRESS_VERSION}
# remove old containers
docker container inspect ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME}
# run tests
docker run -i \
  --name=${CONTAINER_NAME} \
  -v "$PWD":"$PWD" \
  -w "$PWD" \
  --entrypoint=cypress \
  --ipc=host \
  --shm-size="512M" \
  cypress/included:${CYPRESS_VERSION} \
  run-ct \
  --browser chrome \
  --headless

# remove screenshot folder
rm -rf cypress/screenshots/
