FROM alpine:latest

WORKDIR /usr/bin

RUN apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-2.35-r1.apk && \
    apk add glibc-2.35-r1.apk && \
    rm -rf glibc-2.35-r1.apk

COPY get_url.sh /get_url.sh
ARG ARCH
ARG VERSION

RUN wget -q -O "snell-server.zip" $(/get_url.sh ${VERSION} ${ARCH}) && \
    unzip snell-server.zip && rm snell-server.zip && \
    apk del wget && \
    rm -f /get_url.sh

ENV TZ=UTC
ENV PATH /usr/bin:$PATH

COPY start.sh /start.sh
RUN apk add --update --no-cache libstdc++

ENTRYPOINT /start.sh
# ENTRYPOINT ["cat", "/arg3.txt"]
