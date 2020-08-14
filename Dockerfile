FROM alpine:3.12
ENV QQ=""
ENV PASSWORD=""
ENV TOKEN=""
ENV POSTURL=""
ENV SECRET=""
ENV ENV="nornal"
#ADD mirai /mirai
RUN mkdir /mirai
COPY init.sh /
#COPY mirai.zip /
COPY check.php /
WORKDIR /mirai

RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN  apk add --no-cache ca-certificates && \
     apk add --no-cache curl bash tree tzdata php7-openssl php7 php7-curl php7-json expect openjdk8 git && \
     cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime\
     && apk del tzdata \
     && chmod +x /init.sh
HEALTHCHECK --interval=5s --timeout=2s --retries=10 \
  CMD php /check.php || exit 1

CMD ["/init.sh"]
