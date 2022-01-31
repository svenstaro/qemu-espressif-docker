FROM docker.io/archlinux:base-devel
RUN pacman -Sy --confirm git && \
    git clone https://github.com/espressif/qemu.git && \
    cd qemu && \
    ./configure --target-list=xtensa-softmmu \
    --enable-gcrypt \
    --enable-debug --enable-sanitizers \
        --disable-strip --disable-user \
        --disable-capstone --disable-vnc \
        --disable-sdl --disable-gtk && \
    ninja -C build && \
    mv build/qemu-system-xtensa / && \
    cd .. && \
    rm -rf qemu && \
    pacman -Rsn --confirm git && \
    pacman -Scc --confirm
COPY /qemu-system-xtensa /usr/bin/qemu-system-xtensa
ENTRYPOINT /usr/bin/qemu-system-xtensa
