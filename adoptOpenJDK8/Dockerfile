# 使用镜像源
FROM midaug/alpine-cn-adoptopenjdk8:latest

# 镜像作者信息
LABEL MAINTAINER midaug "blog.midaug.win"

RUN mkdir /data && mkdir /data/logs

VOLUME ["/tmp", "/data"] 

ENV JAVA_OPTS=""
ENV APP_TYPE="war"

WORKDIR  /data

# 启动命令行
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /data/app.$APP_TYPE | tee /data/logs/run.log" ]
