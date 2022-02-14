#!/bin/bash
set -e

mkdir ~/bin
curl -L https://raw.githubusercontent.com/confluentinc/confluent-docker-utils/master/confluent/docker_utils/cub.py -o ./cub.py
curl -L https://github.com/treff7es/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz | tar -C ./ -xzv
chmod +x /datahub/cub.py /datahub/kafka-setup.sh
