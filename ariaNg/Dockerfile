FROM nginx:alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
&& apk add --no-cache openssl \
&& printf "yourName:$(openssl passwd -crypt yourPassword)\n" > /htpasswd \
&& wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip \
&& unzip  master.zip && mv AriaNg-DailyBuild-master/* /usr/share/nginx/html/ \
&& rm -rf master.zip AriaNg-DailyBuild-master
