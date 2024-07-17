FROM node:20.15.1-bookworm
LABEL maintainer="S M Y ALTAMASH <smy.altamash@gmail.com>"
WORKDIR /home/enc
COPY . /home/enc
# Install necessary packages and cleanup in a single RUN statement
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        g++ \
        build-essential \
        zip \
        python3 \
        make \
    && npm install -g npm@latest \
    && apt-get purge -y --auto-remove \
        g++ \
        build-essential \
        make \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8013
CMD ["sh", "entrypoint.sh"]
