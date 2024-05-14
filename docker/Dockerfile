FROM --platform=linux/amd64 ubuntu:22.04

RUN dpkg --add-architecture i386

# Install dependencies
RUN apt-get update -y &&\
  apt-get install -y --no-install-recommends \
  libc6:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  build-essential \
  curl \
  g++ \
  libtool \
  make \
  unzip \
  wget && \
  rm -rf /var/lib/apt/lists/*

RUN wget --no-verbose --show-progress --progress=dot:mega \
  https://wiki.telink-semi.cn/tools_and_sdk/Tools/IDE/telink_riscv_linux_toolchain.zip \
  --no-check-certificate -O /tmp/telink_riscv_linux_toolchain.zip && \
  unzip /tmp/telink_riscv_linux_toolchain.zip -d /toolchain && \
  rm /tmp/telink_riscv_linux_toolchain.zip

ENV PATH=/toolchain/telink_riscv_linux_toolchain/nds32le-elf-mculib-v5f/bin:$PATH

WORKDIR /telink_b91
