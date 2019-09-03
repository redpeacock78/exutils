FROM alpine:latest

MAINTAINER redpeacock78

USER root
RUN echo 'Install Dependency...' && \
    apk update >/dev/null && \
    apk --no-cache add coreutils findutils bash gawk grep sed git >/dev/null && \
    cd $HOME && \
    git clone https://github.com/redpeacock78/exutils 2>/dev/null && \
    $HOME/exutils/install.sh --docker && \
    rm -rf exutils/ && \
    apk del git >/dev/null && \
    rm -rf /var/cache/apk/*

ENV PATH $PATH:/root/.exutils/bin