FROM alpine

MAINTAINER redpeacock78

RUN apk update && \
    apk --no-cache add coreutils && \
    apk --no-cache add findutils && \
    apk --no-cache add bash && \
    apk --no-cache add gawk && \
    apk --no-cache add grep && \
    apk --no-cache add sed && \
    apk --no-cache add git && \
    rm -rf /var/cache/apk/* && \
    cd home && \
    git clone https://github.com/redpeacock78/exutils && \
    cp /home/exutils/bin/camb /usr/local/bin/ && \
    cp /home/exutils/bin/divi /usr/local/bin/ && \
    cp /home/exutils/bin/prim /usr/local/bin/ && \
    cp /home/exutils/docker/bin/help /usr/local/bin && \
    rm -rf exutils/ && \
    apk del git