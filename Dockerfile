FROM --platform=$TARGETPLATFORM ubuntu:latest AS downloader

ADD https://install.direct/go.sh go.sh

RUN chmod +x go.sh && ./go.sh

FROM --platform=$TARGETPLATFORM alpine:latest

COPY --from=downloader /usr/bin/v2ray/v2ray /usr/bin/v2ray/
COPY --from=downloader /usr/bin/v2ray/v2ctl /usr/bin/v2ray/
COPY --from=downloader /usr/bin/v2ray/geoip.dat /usr/bin/v2ray/
COPY --from=downloader /usr/bin/v2ray/geosite.dat /usr/bin/v2ray/

RUN set -ex && \
    apk --no-cache add ca-certificates && \
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray && \
    mkdir -p /var/log/v2ray

ENV PATH /usr/bin/v2ray:$PATH

VOLUME [ "/etc/v2ray" ]

ENTRYPOINT [ "v2ray" ]

CMD [ "-config=/etc/v2ray/config.json" ]
