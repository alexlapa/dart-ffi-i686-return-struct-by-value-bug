FROM i386/ubuntu:bionic

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y make clang curl unzip

RUN curl -O https://storage.googleapis.com/dart-archive/channels/stable/release/2.13.0/sdk/dartsdk-linux-ia32-release.zip \
    && unzip dartsdk-linux-ia32-release.zip -d /usr/lib \
    && ln -s /usr/lib/dart-sdk/bin/dart /usr/local/bin

CMD clang --version && dart --version && make run.clang