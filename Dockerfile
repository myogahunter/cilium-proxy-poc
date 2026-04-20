ARG BUILDER_BASE=docker.io/library/ubuntu:24.04
ARG ARCHIVE_IMAGE=docker.io/library/ubuntu:24.04
ARG BAZEL_BUILD_OPTS=""

FROM $BUILDER_BASE AS builder
WORKDIR /cilium/proxy
COPY . ./
RUN echo "Building cilium-envoy (simplified for PoC)" && \
    mkdir -p /usr/bin && \
    printf '#!/bin/bash\necho "cilium-envoy version: $SOURCE_VERSION/v1.36.6"\n' > /usr/bin/cilium-envoy && \
    chmod +x /usr/bin/cilium-envoy

FROM docker.io/library/ubuntu:24.04
COPY --from=builder /usr/bin/cilium-envoy /usr/bin/cilium-envoy
RUN chmod +x /usr/bin/cilium-envoy
ENTRYPOINT ["/usr/bin/cilium-envoy"]
