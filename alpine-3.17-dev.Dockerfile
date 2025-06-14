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

FROM alpine:3.17

ENV TZ=Etc/UTC
ENV ARCH=x64

RUN apk --no-cache --upgrade add build-base cmake git bash sudo  \
    autoconf boost-static boost-dev flex-dev bison make clang    \
    binutils-dev libevent-dev acl-dev sed python3 pkgconfig curl \
    lz4-dev openssl-dev zlib-dev xz ninja zip unzip tar xz-dev   \
    libunwind-dev libdwarf-dev gflags-dev elfutils-dev gcompat   \
    libevent-static openssl-libs-static lz4-static libffi-dev    \
    zlib-static libunwind-static acl-static fmt-dev xz-static    \
    gdbm-dev yaml-dev yaml-static ncurses-dev ncurses-static     \
    readline-dev readline-static p7zip ruby-dev  jemalloc-dev    \
    gettext-dev gperf brotli-dev brotli-static clang libxslt-dev \
    libxslt-static ccache double-conversion-dev glog-dev

RUN gem install bundler

ENV CC=clang
ENV CXX=clang++

ENV PS1="\[\]\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \[\]"
CMD ["bash"]
