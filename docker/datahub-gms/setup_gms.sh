#!/bin/bash
set -e

curl https://archiva.wikimedia.org/repository/mirror-maven-central/org/eclipse/jetty/jetty-runner/9.4.46.v20220331/jetty-runner-9.4.46.v20220331.jar --output jetty-runner.jar
curl https://archiva.wikimedia.org/repository/mirror-maven-central/org/eclipse/jetty/jetty-jmx/9.4.46.v20220331/jetty-jmx-9.4.46.v20220331.jar --output jetty-jmx.jar
curl https://archiva.wikimedia.org/repository/mirror-maven-central/org/eclipse/jetty/jetty-util/9.4.46.v20220331/jetty-util-9.4.46.v20220331.jar --output jetty-util.jar
curl http://archiva.wikimedia.org/repository/mirror-maven-central/io/opentelemetry/javaagent/instrumentation/opentelemetry-javaagent/0.14.0/opentelemetry-javaagent-0.14.0.jar --output opentelemetry-javaagent-all.jar
curl http://archiva.wikimedia.org/repository/mirror-maven-central/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar --output jmx_prometheus_javaagent.jar
curl -L https://github.com/treff7es/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz | tar -C ./ -xzv
