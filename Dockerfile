FROM alpine
RUN apk add coreutils && \
    apk add findutils && \
    apk add bash && \
    apk add gawk && \
    apk add grep && \
    apk add git && \
    cd home && \
    git clone https://github.com/redpeacock78/exutils && \
    cd /usr/local/bin && \
    ln -s /home/exutils/bin/camb camb && \
    ln -s /home/exutils/bin/divi divi && \
    ln -s /home/exutils/bin/prim prim