FROM alpine

COPY ./crontab /

RUN cp /etc/apk/repositories /etc/apk/repositories.bak \
&& sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
&& apk update \
&& apk add --no-cache aria2 tzdata \
&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo 'Asia/Shanghai' >/etc/timezone \
&& crontab /crontab \
&& mkdir /aria2-download
CMD crond && /usr/bin/aria2c --conf-path=/aria2/aria2.conf
