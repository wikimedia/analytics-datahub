#!/bin/bash
set -e

curl -L https://github.com/treff7es/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz | tar -C ./ -xzv
chmod +x /datahub/create-indices.sh
