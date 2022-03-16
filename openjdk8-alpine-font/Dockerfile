FROM openjdk:8u181-jre-alpine3.8

ADD simsun.ttf /tmp/
ADD repositories /etc/apk/repositories

RUN \
    apk update && \
    apk add font-adobe-100dpi tzdata && \
    mkdir /usr/share/fonts/win && \
    mv /tmp/simsun.ttf /usr/share/fonts/win/simsun.ttf && \
    fc-cache -f -v  && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  && \
    apk del tzdata
