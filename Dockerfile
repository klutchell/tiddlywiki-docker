FROM node:alpine

ARG BUILD_DATE
ARG BUILD_VERSION=5.1.22
ARG VCS_REF

ENV NODE_ENV production

RUN npm install -g "tiddlywiki@${BUILD_VERSION}"

VOLUME /var/lib/tiddlywiki

WORKDIR /var/lib/tiddlywiki

COPY host.tid entrypoint.sh /

CMD [ "/entrypoint.sh" ]

EXPOSE 8080

LABEL org.opencontainers.image.authors "Kyle Harding <https://klutchell.dev>"
LABEL org.opencontainers.image.url "https://github.com/klutchell/tiddlywiki-docker"
LABEL org.opencontainers.image.documentation "https://github.com/klutchell/tiddlywiki-docker"
LABEL org.opencontainers.image.source "https://github.com/klutchell/tiddlywiki-docker"
LABEL org.opencontainers.image.title "klutchell/tiddlywiki"
LABEL org.opencontainers.image.description "TiddlyWiki is a personal wiki and a non-linear notebook for organising and sharing complex information"
LABEL org.opencontainers.image.created "${BUILD_DATE}"
LABEL org.opencontainers.image.version "${BUILD_VERSION}"
LABEL org.opencontainers.image.revision "${VCS_REF}"
