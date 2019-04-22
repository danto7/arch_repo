#!/bin/bash
sudo chown -R builder "$PKGDEST"
cd "$1" || exit 1
deps=$(makepkg --printsrcinfo | grep depends | grep -v optdepends | awk '{print $3}')
printf "Installing make dependencies...\n\n"
printf "%s\n" "$deps" | xargs sudo pacman -Sy --noconfirm --needed
makepkg