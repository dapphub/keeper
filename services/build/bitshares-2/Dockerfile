FROM ubuntu:15.04
MAINTAINER Fabian Schuh <Fabian@cryptonomex.com>

## Core Utilities
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential \
                       gcc-4.9 \
                       g++-4.9 \
                       cmake \
                       make \
                       libbz2-dev \
                       libdb++-dev \
                       libdb-dev \
                       libssl-dev \
                       openssl \
                       libreadline-dev \
                       autoconf \
                       libtool \
                       git \
                       autotools-dev \
                       libbz2-dev \
                       libicu-dev \
                       python-dev \
                       wget

## Boost 1.57
WORKDIR /
RUN wget -c 'http://sourceforge.net/projects/boost/files/boost/1.57.0/boost_1_57_0.tar.bz2/download'\
         -O /boost_1_57_0.tar.bz2
RUN tar xjf /boost_1_57_0.tar.bz2
WORKDIR boost_1_57_0/
RUN ./bootstrap.sh "--prefix=/opt/boost_1_57_0"
RUN ./b2 install

## Fetching BitShares-2
WORKDIR /
RUN git clone https://github.com/bitshares/bitshares-2 /bitshares-2-git
WORKDIR /bitshares-2-git
RUN git submodule update --init --recursive

## Building BitShares-2
RUN mkdir /build
WORKDIR /build
RUN CC=gcc-4.9 CXX=g++-4.9 cmake -DBOOST_ROOT="/opt/boost_1_57_0" -DCMAKE_BUILD_TYPE=Release /bitshares-2-git
RUN make || make -j 1

RUN mkdir /bitshares-2
RUN cp -r /build/programs /bitshares-2/

## Cleanup to reduce container size
RUN rm -rf /boost_1_57_0.tar.bz2 \
           /boost_1_57_0 \
           /bitshares-2-git \
           /build
