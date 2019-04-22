FROM archlinux/base
RUN pacman -Sy base-devel git --noconfirm --needed
RUN rm -rf /var/cache/pacman/pkg/*
RUN useradd -m builder
RUN echo "builder	ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER builder
COPY build.sh /build.sh
ENV PKGDEST /tmp/out
WORKDIR /home/builder
ENTRYPOINT /bin/bash