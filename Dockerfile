FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    cmake \
    ninja-build \
    wget \
    libgl1-mesa-dev \
    libx11-dev \
    libasound-dev \
    vim \
    && \
    # 3. Czyszczenie cache APT i usuwanie niepotrzebnych plików
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

CMD ["/bin/bash"]
