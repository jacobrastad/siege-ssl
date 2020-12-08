  
FROM ubuntu:latest
LABEL maintainer="Jacob Rastad"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get --no-install-recommends -y install \
    openssl \
    libssl-dev \
    wget \
    build-essential \
    zlib1g \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists 

RUN wget http://download.joedog.org/siege/siege-4.0.7.tar.gz \
    && tar -xvf siege-4.0.7.tar.gz \
    && cd siege-4.0.7 \
    && ./configure --prefix=/usr/local --with-ssl=/usr/bin/openssl \
    && make \
    && make install \
    && mkdir $HOME/.siege \
    && siege.config \
    && ls -la $HOME/ \
    && sed -i 's/^json_output = true$/json_output = false/g' $HOME/.siege/siege.conf

ENTRYPOINT ["siege"]
CMD ["--help"]