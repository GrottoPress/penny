ARG ALPINE_VERSION=3.20
ARG CRYSTAL_VERSION=1.12
ARG NODE_VERSION=20.12

FROM crystallang/crystal:${CRYSTAL_VERSION}-alpine AS crystal

ARG COMPILE_FLAGS=

RUN ["apk", "add", "--no-cache", "curl", "git", "jq", "openssh-client"]

RUN mkdir -pm 0700 ~/.ssh && \
    curl --silent https://api.github.com/meta | jq --raw-output \
        '"github.com "+.ssh_keys[]' >> ~/.ssh/known_hosts && \
    chmod 600 ~/.ssh/known_hosts

WORKDIR /tmp/lucky

COPY . .

# If using webfactory/ssh-agent action
# COPY ./root-config /root/
# RUN sed 's|/home/runner|/root|g' -i.bak /root/.ssh/config

RUN --mount=type=ssh,id=ssh-key shards build --static -Dpreview_mt \
        --production --skip-postinstall --skip-executables ${COMPILE_FLAGS}

FROM node:${NODE_VERSION}-alpine AS node

RUN ["apk", "add", "curl", "git", "jq", "openssh-client"]

RUN mkdir -pm 0700 ~/.ssh && \
    curl --silent https://api.github.com/meta | jq --raw-output \
        '"github.com "+.ssh_keys[]' >> ~/.ssh/known_hosts && \
    chmod 600 ~/.ssh/known_hosts

WORKDIR /tmp/lucky

COPY --chown=node:node . .

# If using webfactory/ssh-agent action
# COPY ./root-config /root/
# RUN sed 's|/home/runner|/root|g' -i.bak /root/.ssh/config

RUN --mount=type=ssh,id=ssh-key npm ci && npm run prod

FROM alpine:${ALPINE_VERSION}

RUN addgroup -S app-data && adduser -SH app-data -G app-data

WORKDIR /srv/app

COPY --from=crystal --chown=app-data:app-data /tmp/lucky/bin/ ./bin/
COPY --from=crystal --chown=app-data:app-data /tmp/lucky/lang/ ./lang/

COPY --from=node --chown=app-data:app-data /tmp/lucky/public/ ./public/
# COPY --from=node --chown=app-data:app-data /tmp/lucky/node_modules/ ./node_modules/
# COPY --from=node --chown=app-data:app-data /tmp/lucky/package*.json .

RUN chmod +x bin/*

RUN ["apk", "add", "--no-cache", "tzdata"]

USER app-data:app-data

CMD bin/cli db.migrate && bin/app
