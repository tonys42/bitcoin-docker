ARG UBUNTU_VERSION=20.04
FROM ubuntu:$UBUNTU_VERSION

ARG BITCOIN_VERSION=24.0.1
ARG DOWNLOAD_URL="https://bitcoincore.org/bin/bitcoin-core-$BITCOIN_VERSION/bitcoin-$BITCOIN_VERSION-x86_64-linux-gnu.tar.gz"

RUN apt-get update && apt-get install -y tini curl && rm -rf /var/lib/apt/lists/*

RUN curl $DOWNLOAD_URL | tar -xz -C /usr/bin --strip-components=2 bitcoin-$BITCOIN_VERSION/bin

ENTRYPOINT [ "tini" , "--", "bitcoind" ]