FROM alpine:3.10

LABEL maintainer="Gustav Svensk <grulfen3@gmail.com>"

EXPOSE 10240

RUN echo "*** Installing Compiler Explorer ***" \
    && apk add --no-cache \
        wget \
        ca-certificates \
        make \
        nodejs \
        npm \
        git \
        clang \
        g++ \
        xvfb \
    && git clone https://github.com/mattgodbolt/compiler-explorer.git /compiler-explorer \
    && cd /compiler-explorer \
    && make webpack \
    && apk del \
        wget

WORKDIR /compiler-explorer

ENTRYPOINT [ "make" ]

CMD ["run"]
