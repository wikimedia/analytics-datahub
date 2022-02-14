#!/bin/bash
set -e

curl http://archiva.wikimedia.org/repository/mirror-maven-central/io/opentelemetry/javaagent/instrumentation/opentelemetry-javaagent/0.14.0/opentelemetry-javaagent-0.14.0.jar --output opentelemetry-javaagent-all.jar
curl http://archiva.wikimedia.org/repository/mirror-maven-central/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar --output jmx_prometheus_javaagent.jar
curl -L https://github.com/treff7es/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz | tar -C ./ -xzv
chmod +x ./scripts/start.sh
