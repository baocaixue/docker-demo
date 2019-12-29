FROM openjdk:8-jre
MAINTAINER fjy8018 fjy8018@gmail.com

# Mycat 版本
ENV MYCAT_VERSION 1.6-RELEASE
ENV MYCAT_PKG Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz

WORKDIR /usr/local

# 缓存层
RUN wget http://dl.mycat.io/$MYCAT_VERSION/$MYCAT_PKG
RUN apt-get update && \
    apt-get install -y procps && \
    apt-get clean && \
    tar -zxf /usr/local/$MYCAT_PKG && \
    rm -rf /usr/local/$MYCAT_PKG

VOLUME /usr/local/mycat/conf

EXPOSE 8066 9066

ENTRYPOINT /usr/local/mycat/bin/mycat console

作者：F嘉阳
链接：https://juejin.im/post/5d41a761e51d45621512acf1
来源：掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。