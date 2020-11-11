#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SDIR"

yay -S --noconfirm \
    awesome-git \
    rofi \
    lm_sensors \
    jq \
    fortune-mod \
    redshift \
    mpd \
    mpc \
    maim \
    feh \
    light-git \
    pulseaudio \
    inotify-tools \
    xdotool \
    acpid # battery

mkdir -p ~/.local/share/fonts
cp -r ./fonts/* ~/.local/share/fonts

fc-cache -fv

CONF=~/.config/awesome
mkdir -p ~/.config
read -n1 -rp "$CONF will be removed. Continue? [y/N] " res; echo
[[ ! $res =~ y|Y ]] && exit 1

rm -rf "$CONF"
ln -s "$SDIR/awesome" "$CONF"
