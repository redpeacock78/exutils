FROM alpine
RUN apk update && \
    apk --no-cache add coreutils && \
    apk --no-cache add findutils && \
    apk --no-cache add bash && \
    apk --no-cache add gawk && \
    apk --no-cache add grep && \
    apk --no-cache add git && \
    rm -rf /var/cache/apk/* && \
    cd home && \
    git clone https://github.com/redpeacock78/exutils && \
    ln -s /home/exutils/bin/camb /usr/local/bin/ && \
    ln -s /home/exutils/bin/divi /usr/local/bin/ && \
    ln -s /home/exutils/bin/prim /usr/local/bin/ && \
    rm -rf exutils/