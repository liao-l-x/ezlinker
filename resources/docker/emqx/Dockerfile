FROM alpine:latest
LABEL author="wwhai"
LABEL emai="cnwwhai@gmail.com"
USER root
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add git \
    curl \
    gcc \
    g++ \
    make \
    perl \
    ncurses-dev \
    openssl-dev \
    libressl \
    coreutils \
    bsd-compat-headers \
    libc-dev \
    libstdc++ \
    erlang \
    erlang-xmerl \
    erlang-dialyzer \
    erlang-parsetools \
    erlang-sasl \
    erlang-stdlib \
    erlang-runtime-tools \
    erlang-tftp \
    erlang-ssh \
    erlang-erl-docgen \
    erlang-eunit \
    erlang-inets \
    erlang-tools \
    erlang-snmp \
    erlang-et \
    erlang-dev \
    erlang-debugger \
    erlang-asn1 \
    erlang-erl-interface \
    erlang-hipe \
    erlang-reltool \
    erlang-crypto \
    erlang-ssl \
    erlang-mnesia \
    erlang-compiler \
    erlang-os-mon \
    erlang-erts \
    erlang-public-key \
    erlang-syntax-tools \
    erlang-kernel \
    erlang-eldap \
    erlang-megaco \
    erlang-diameter

ADD ./emqx-4.0-alpine.zip /EZLINKER/
RUN unzip /EZLINKER/emqx-4.0-alpine.zip -d /EZLINKER/
RUN chmod -R 777 /EZLINKER/emqx-4.0-alpine/emqx
EXPOSE 1883 1884 18083
ENTRYPOINT ["/EZLINKER/emqx-4.0-alpine/emqx/bin/emqx","start"]