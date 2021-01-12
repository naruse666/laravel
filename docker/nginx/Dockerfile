FROM    nginx:1.19.6-alpine
SHELL   ["/bin/ash", "-c"]
ENV     TZ=Asia/Tokyo

RUN     apk update

COPY    ./default.conf /etc/nginx/conf.d/default.conf

WORKDIR /work