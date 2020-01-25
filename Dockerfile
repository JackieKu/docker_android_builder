FROM ubuntu:16.04
MAINTAINER Kaichieh Ku <kjackie@gmail.com>

RUN echo "dash dash/sh boolean false" | debconf-set-selections \
    && dpkg-reconfigure -p critical dash

RUN apt-get update && apt-get -y --no-install-recommends install \
    bc \
    bison \
    build-essential \
    ccache \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git-core \
    gnupg \
    gperf \
    imagemagick \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32z1-dev \
    liblz4-tool \
    libncurses5-dev \
    libsdl1.2-dev \
    libssl-dev \
    libwxgtk3.0-dev \
    libxml2 \
    libxml2-utils \
    lzop \
    openjdk-8-jdk \
    pngcrush \
    python \
    python3 \
    rsync \
    schedtool \
    squashfs-tools \
    unzip \
    xsltproc \
    zip \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://storage.googleapis.com/git-repo-downloads/repo /usr/local/bin/
RUN chmod 755 /usr/local/bin/repo

RUN useradd builder --create-home --home-dir=/src --user-group

ENV USER builder
USER ${USER}
WORKDIR /src
