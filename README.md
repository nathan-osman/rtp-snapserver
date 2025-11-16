## rtp-snapserver

This handy Docker container accepts an OPUS audio stream via RTP and uses an embedded Snapcast server to stream the audio to connected clients.

### Usage

The container should be launched like so:

```sh
docker run \
  -p 5004:5004/udp \
  -p 1704:1704 \
  -p 1705:1705 \
  -v /path/for/data:/data \
  nathanosman/rtp-snapserver
```

Three ports are used by the container:

- **UDP 5004** — RTP port for receiving audio stream
- **TCP 1704** — Snapcast clients
- **TCP 1705** — Snapcast control

The `/data` volume is used for persistent data.
