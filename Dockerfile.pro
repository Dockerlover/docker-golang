# 基础镜像
FROM docker-python:pro
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 安装golang
RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository -y ppa:gophers/go
RUN apt-get update && apt-get install -y golang-stable
RUN apt-get autoremove -y python-software-properties software-properties-common && rm -rf /var/lib/apt/lists/*
# 创建默认代码路径
RUN mkdir $HOME/golang && export GOPATH=$HOME/golang && export PATH=$PATH:$GOPATH/bin
