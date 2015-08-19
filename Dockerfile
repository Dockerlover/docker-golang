# 基础镜像 
FROM docker-python
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID golang
# 安装golang
RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository -y ppa:gophers/go
RUN apt-get update && apt-get install -y golang-stable
RUN apt-get autoremove -y python-software-properties software-properties-common && rm -rf /var/lib/apt/lists/*
# 创建默认代码路径
RUN mkdir -p /code
VOLUME ["/code"]
# 默认暴露80端口
EXPOSE  80
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
