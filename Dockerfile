FROM alpine:edge
MAINTAINER Alexander Nordahl <alex@aqumbo.se>

RUN apk add --no-cache \
    aspell-en \
    ca-certificates \
    perl \
    python \
    tzdata \
    weechat \
    weechat-aspell \
    weechat-perl \
    weechat-python 

RUN adduser -D -h /home/wirkk wirkk \
    && mkdir -p /home/wirkk/.weechat \
    && chown -R wirkk:wirkk /home/wirkk

ENV LANG en_US.utf8
ENV TERM screen-256color
ENV TZ=Europe/Stockholm

WORKDIR /home/wirkk
VOLUME /home/wirkk/.weechat
USER wirkk

ENTRYPOINT ["weechat"]
