
FROM archlinux/archlinux:base-devel

RUN pacman -Syu --noconfirm --needed git sudo \
   && echo "container ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
   && useradd --create-home container
USER container
RUN git clone https://aur.archlinux.org/yay /tmp/yay \
   && cd /tmp/yay \
   && makepkg -si --noconfirm \
   && yay -Syu nordvpn-bin \
   && rm -r /tmp/yay
WORKDIR /home/container
