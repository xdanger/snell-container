# FROM alpine:latest
FROM debian:stable-slim

ARG ARCH
ARG VERSION
ENV TZ=UTC
# ENV PATH /usr/bin:$PATH

WORKDIR /usr/local/bin
COPY get_url.sh /get_url.sh
COPY start.sh /start.sh

# RUN apk --no-cache add ca-certificates wget && \
#     wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
#     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-2.35-r1.apk && \
#     apk add glibc-2.35-r1.apk && \
#     rm -rf glibc-2.35-r1.apk
# RUN apk add --update --no-cache libstdc++

RUN apt-get update && apt-get install -y wget unzip && \
    chmod +x /get_url.sh && \
    wget -q -O "snell-server.zip" $(/get_url.sh ${VERSION} ${ARCH}) && \
    unzip snell-server.zip && rm snell-server.zip && \
    apt-get remove -y wget unzip && apt-get autoremove -y && \
    rm -f /get_url.sh


ENTRYPOINT ["/start.sh"]
# ENTRYPOINT ["cat", "/arg3.txt"]
