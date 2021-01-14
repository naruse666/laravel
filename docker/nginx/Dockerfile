FROM    node:15.5-alpine3.11
FROM    nginx:1.19.6-alpine
SHELL   ["/bin/ash", "-c"]
ENV     TZ=Asia/Tokyo

RUN     apk update
#node
COPY --from=node /usr/local/bin /usr/local/bin
#npm
COPY --from=node /usr/local/lib /usr/local/lib

COPY    ./default.conf /etc/nginx/conf.d/default.conf

WORKDIR /work