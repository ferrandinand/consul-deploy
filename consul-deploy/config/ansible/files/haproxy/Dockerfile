FROM alpine
MAINTAINER Ilkka Anttonen version: 0.3

RUN apk --update add haproxy wget unzip curl

RUN ( wget --no-check-certificate https://releases.hashicorp.com/consul-template/0.12.2/consul-template_0.12.2_linux_amd64.zip -O /tmp/consul_template.zip && cd /tmp && unzip consul_template.zip  && mv consul-template /usr/bin && rm -rf /tmp/* )

COPY haproxy.json /tmp/haproxy.json
COPY haproxy.ctmpl /tmp/haproxy.ctmpl
CMD ["consul-template", "-config=/tmp/haproxy.json"]

