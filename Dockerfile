FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    clang \
    cmake \
    libx11-dev \
    libxinerama-dev \
    libxft-dev \
    git \
    wget \
    curl

COPY patches.txt /
RUN mkdir /dmenu_patches
COPY build_dir.diff /dmenu_patches
COPY build.sh /
