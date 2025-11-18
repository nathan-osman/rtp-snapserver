FROM alpine:latest

ARG S6_VERSION=v3.2.1.0
ARG SNAPWEB_VERSION=v0.9.2

# Install s6-overlay
RUN \
  wget -qO - https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-noarch.tar.xz | tar xJ && \
  wget -qO - https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-x86_64.tar.xz | tar xJ

# Install the required packages
RUN apk add --no-cache \
  gstreamer-tools \
  gst-plugins-good \
  snapcast

# Install Snapweb into the doc_root
RUN \
  wget -q https://github.com/badaix/snapweb/releases/download/${SNAPWEB_VERSION}/snapweb.zip && \
  unzip snapweb.zip -od /usr/share/snapserver/snapweb && \
  rm snapweb.zip

# Add configuration files
COPY rootfs /

# Run snapserver
ENTRYPOINT ["/init"]
