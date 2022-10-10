FROM gcc:9 AS builder

RUN set -ex;                                                                      \
    apt-get update;                                                               \
    apt-get install -y cmake libzmq3-dev;                                         \
    mkdir -p /usr/src;                                                            \
    cd /usr/src;                                                                  \
    curl -L https://github.com/zeromq/cppzmq/archive/v4.6.0.tar.gz | tar -zxf -;  \
    cd /usr/src/cppzmq-4.6.0;                                                     \
    cmake -D CPPZMQ_BUILD_TESTS:BOOL=OFF .; make; make install

COPY . /usr/src/example

RUN set -ex;              \
    cd /usr/src/example;  \
    cmake .; make; make install

FROM debian:buster

RUN set -ex;         \
    apt-get update;  \
    apt-get install -y libzmq5

COPY --from=builder /usr/local/bin /usr/local/bin

ENTRYPOINT ["server"]