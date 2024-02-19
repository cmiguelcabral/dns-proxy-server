FROM --platform=$BUILDPLATFORM debian:12-slim
ARG BUILDPLATFORM
ARG TARGETPLATFORM
ARG TARGETARCH
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM ($TARGETARCH)"
COPY ./build/artifacts/linux_${TARGETARCH}/dns-proxy-server /app/dns-proxy-server
WORKDIR /app
LABEL dps.container=true
ENV DPS_CONTAINER=1
VOLUME ["/var/run/docker.sock", "/var/run/docker.sock"]
RUN echo "$TARGETARCH" > /app/$TARGETARCH
ENTRYPOINT ["/app/dns-proxy-server"]
