# 使用镜像源
FROM openjdk:11.0.2-jdk-oracle

# 镜像作者信息
LABEL MAINTAINER midaug "blog.midaug.win"

# 设定系统语言环境
ENV LANG="zh_CN.UTF-8" \
LC_ALL="zh_CN.UTF-8"

# 配置系统时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
 
RUN mkdir /data && mkdir /data/logs

VOLUME ["/tmp", "/data"] 

ENV JAVA_OPTS=""
ENV APP_TYPE="war"

WORKDIR  /data

# 启动命令行
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /data/app.$APP_TYPE | tee /data/logs/run.log" ]
