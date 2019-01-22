# 使用镜像源
FROM openjdk:8u191-jdk-alpine3.8

# 镜像作者信息
LABEL MAINTAINER midaug "blog.midaug.win"

# 设定系统语言环境
ENV LANG="zh_CN.UTF-8" \
LC_ALL="zh_CN.UTF-8"

# 配置系统时区
RUN apk --no-cache add tzdata  && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  && \
    echo "Asia/Shanghai" > /etc/timezone  && \
    apk del tzdata

RUN mkdir /data && mkdir /data/logs

VOLUME ["/tmp", "/data"] 
EXPOSE 8080

ENV JAVA_OPTS=""

WORKDIR  /data

# 启动命令行
ENTRYPOINT [ "sh", "-c", "java -Dserver.port=8080 $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /data/app.war | tee /data/logs/run.log" ]