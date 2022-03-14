FROM docker.io/archlinux:base-devel
RUN pacman -Sy --noconfirm git python ninja pixman libgcrypt && \
    git clone https://github.com/espressif/qemu.git && \
    cd qemu && \
    ./configure \
        --target-list=xtensa-softmmu \
        --prefix=/usr \
        --enable-gcrypt \
        --disable-strip \
        --disable-user \
        --disable-capstone \
        --disable-vnc \
        --disable-sdl \
        --disable-gtk && \
    ninja -C build && \
    ninja -C build install && \
    cd .. && \
    rm -rf qemu && \
    pacman -Rsn --noconfirm git && \
    pacman -Scc --noconfirm
ENTRYPOINT /bin/bash
