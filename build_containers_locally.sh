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
echo '#### Cleaning build cache ####'
docker builder prune -f

for c in gms frontend mce-consumer mae-consumer
do
  echo "#### Working on $c ####"
  for i in build test prepare production
  do
    echo "#### Removing containters for $c-$i ####"
    for d in $(docker ps -aq --filter="ancestor=datahub-$c-$i")
    do
      docker rm -f $d
    done

    if docker image ls -q datahub-$c-$d; then
      echo "#### Removing container image for $c-$i ####"
      docker rmi datahub-$c-$i
    fi
    echo "#### Building container image for $c-$i ####"
    blubber .pipeline/datahub-$c/blubber.yaml build | docker build -t datahub-$c-$i -f - .
  done
done
