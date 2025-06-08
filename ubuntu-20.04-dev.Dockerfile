# Copyright (c) 2025 [Maxim Samsonov](https://www.sw.consulting).
# Copyright (c) 2024-2025 [Ribose Inc](https://www.ribose.com).
# All rights reserved.
# This file is a part of the Malpeneco project.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ARG ARCH=x64

RUN apt-get -y update && \
    apt-get -y install sudo wget git make pkg-config software-properties-common      && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test                                && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -        && \
    add-apt-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-14 main" && \
    apt-get -y update                                                                && \
    apt-get -y install clang-14 lld-14 clangd-14 gcc-11 g++-11                \
    autoconf binutils-dev libevent-dev acl-dev libjemalloc-dev                \
    libdouble-conversion-dev libiberty-dev liblz4-dev liblzma-dev libssl-dev  \
    libboost-filesystem-dev libboost-program-options-dev libboost-system-dev  \
    libboost-iostreams-dev  libboost-date-time-dev libboost-context-dev       \
    libboost-regex-dev libboost-thread-dev libbrotli-dev libunwind-dev        \
    libdwarf-dev libelf-dev libgoogle-glog-dev libffi-dev libgdbm-dev         \
    libyaml-dev libncurses-dev libreadline-dev libstdc++-11-dev               \
    perl build-essential zlib1g-dev curl gpg gcovr ccache

ENV CC=clang-14
ENV CXX=clang++-14
ENV LD=ld.lld-14

COPY tools /opt/tools
RUN /opt/tools/tools.sh install_cmake && \
    /opt/tools/tools.sh install_ruby && \
    /opt/tools/tools.sh install_openssl

ENV PS1="\[\]\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \[\]"
CMD ["bash"]
