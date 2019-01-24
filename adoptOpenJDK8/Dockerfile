# 使用镜像源
FROM adoptopenjdk/openjdk8:jdk8u202-b08-alpine-slim

# 镜像作者信息
LABEL MAINTAINER midaug "blog.midaug.win"

# 设定系统语言环境
ENV LANG="zh_CN.UTF-8"

# 配置系统时区
RUN apk --no-cache add tzdata  && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  && \
    echo "Asia/Shanghai" > /etc/timezone  && \
    apk del tzdata

RUN mkdir /data && mkdir /data/logs

VOLUME ["/tmp", "/data"] 

ENV JAVA_OPTS=""
ENV APP_TYPE="war"

WORKDIR  /data

# 启动命令行
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /data/app.$APP_TYPE | tee /data/logs/run.log" ]
