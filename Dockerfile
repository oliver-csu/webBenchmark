FROM alpine

WORKDIR /app
COPY ./webBenchmark_linux_amd64 /app/netflowFlasher
RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

ENTRYPOINT /app/netflowFlasher
