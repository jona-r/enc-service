FROM node:6.14.1-alpine

MAINTAINER "S M Y ALTAMASH" "smy.altamash@gmail.com"

WORKDIR /home/enc

COPY . /home/enc

# Install necessary packages
RUN apk update \
    && apk add --no-cache \
        g++ \
        build-base \
        zip \
        python3 \
        make \
    && npm install -g npm@latest \
    && apk del \
        g++ \
        build-base \
        python3 \
        make \
    && rm -rf /var/cache/apk/*

EXPOSE 8013

CMD ["sh", "entrypoint.sh"]
