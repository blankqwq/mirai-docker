FROM openjdk:11-jre
LABEL maintainer="blankqwq <github.com/blankqwq>"
ENV TZ=Asia/Shanghai

ADD ./config.json /data/mirai/config.json

ARG CHANGE_SOURCE=true
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # Change application source from deb.debian.org to aliyun source
    sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list \
;fi

RUN apt-get update && \
    apt-get -y install libmcrypt-dev libzip-dev zip git unzip vim

ARG MCL_VERSION=1.2.2
RUN curl -L -o /tmp/mcl.zip "https://github.com/iTXTech/mirai-console-loader/releases/download/v${MCL_VERSION}/mcl-${MCL_VERSION}.zip" \
    && unzip /tmp/mcl.zip -d /data/mirai \
    && cd /data/mirai \
    && chmod +x ./mcl \
    && ./mcl --dry-run

EXPOSE 8082
CMD ["./mcl"]
WORKDIR /data/mirai
