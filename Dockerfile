FROM ubuntu:focal

LABEL maintainer="Gustav Svensk <grulfen3@gmail.com>"

EXPOSE 10240

RUN echo "*** Installing Compiler Explorer ***" \
    && apt-get update -y \
    && apt-get install -y \
        wget \
        ca-certificates \
        make \
        git \
        curl \
        clang-6.0 \
        clang-7 \
        clang-8 \
        clang-9 \
        clang-10 \
        g++-7 \
        g++-8 \
        g++-9 \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && apt-get install -y nodejs \
    && git clone https://github.com/mattgodbolt/compiler-explorer.git /compiler-explorer \
    && cd /compiler-explorer \
    && make webpack \
    && apt-get remove -y \
        wget \
        curl \
    && apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && rm -rf /var/cache/apt/* /tmp/*


WORKDIR /compiler-explorer

ENTRYPOINT [ "make" ]

CMD ["run"]
