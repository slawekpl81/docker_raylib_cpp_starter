FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    cmake \
    ninja-build \
    wget \
    ca-certificates \
    libgl1-mesa-dev \
    libx11-dev \
    libasound-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    git \
    vim \
    && \
    # 3. Czyszczenie cache APT i usuwanie niepotrzebnych plików
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

CMD ["/bin/bash"]
