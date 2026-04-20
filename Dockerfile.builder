FROM docker.io/library/ubuntu:24.04
LABEL maintainer="maintainer@cilium.io"
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && rm -rf /var/lib/apt/lists/*
RUN echo "cilium-envoy-builder ready"
