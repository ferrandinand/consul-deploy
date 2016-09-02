FROM ubuntu 
MAINTAINER 	Jeff Lindsay <progrium@gmail.com>

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["mongod"]


ADD ./rootfs.tar /
ADD ./opkg.conf         /etc/opkg.conf
ADD ./opkg-install      /usr/bin/opkg-install
ADD ./functions.sh      /lib/functions.sh
RUN opkg-cl install http://downloads.openwrt.org/snapshots/trunk/x86/64/packages/base/libgcc_4.8-linaro-1_x86_64.ipk
RUN opkg-cl install http://downloads.openwrt.org/snapshots/trunk/x86/64/packages/base/libc_1.1.10-1_x86_64.ipk

CMD ["/bin/sh"]

ADD https://dl.bintray.com/mitchellh/consul/0.4.0_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD https://dl.bintray.com/mitchellh/consul/0.4.0_web_ui.zip /tmp/webui.zip
RUN cd /tmp && unzip /tmp/webui.zip && mv dist /ui && rm /tmp/webui.zip

ADD https://get.docker.io/builds/Linux/x86_64/docker-1.2.0 /bin/docker
RUN chmod +x /bin/docker

RUN /usr/bin/mongod

RUN opkg-install curl bash

ADD ./config /config/
ONBUILD ADD ./config /config/

ADD ./start /bin/start
ADD ./check-http /bin/check-http
ADD ./check-cmd /bin/check-cmd

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp 28017 27017

ENV SHELL /bin/bash

ENTRYPOINT ["/bin/start"]
CMD []
