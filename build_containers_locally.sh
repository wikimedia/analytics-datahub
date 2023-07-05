#!/bin/bash
# This script is simply used to test the container build process locally
# with blubber. It is not a part of the deployment pipeline and will not be
# used during the CI process.
#
# Be aware that the script deletes the build cache, deletes any containers
# based on the images, and deletes the images themselves, before starting a
# new build process. This makes the build process longer each time, but
# reduces the chance of a cache invalidation error.
#

set -xe
export DOCKER_BUILDKIT=1

echo '#### Cleaning build cache ####'
docker builder prune -f

# Find all subdirectories of the .pipeline directory that contain a blubber config file
for c in $(find .pipeline/ -name blubber.yaml | awk -F '/' '{print $2}')
do
  echo "#### Working on $c ####"
  echo "#### Removing containters for $c ####"
  for d in $(docker ps -aq --filter="ancestor=datahub-$c-production")
  do
    docker rm -f $d || /usr/bin/true
  done
  if docker image ls -q datahub-$c-$d; then
    echo "#### Removing container image for $c-production ####"
    docker rmi datahub-$c-production || /usr/bin/true
  fi
  echo "#### Building container image for $c-production ####"
  docker build -t datahub-$c-production -f .pipeline/$c/blubber.yaml --target production .
done
