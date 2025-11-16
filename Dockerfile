FROM alpine:latest

# Install s6-overlay
RUN \
  wget -qO - https://github.com/just-containers/s6-overlay/releases/download/v3.2.1.0/s6-overlay-noarch.tar.xz | tar xJ && \
  wget -qO - https://github.com/just-containers/s6-overlay/releases/download/v3.2.1.0/s6-overlay-x86_64.tar.xz | tar xJ

# Install the required packages
RUN apk add --no-cache \
  gstreamer-tools \
  gst-plugins-good \
  snapcast

# Add configuration files
COPY rootfs /

# Run snapserver
ENTRYPOINT ["/init"]
