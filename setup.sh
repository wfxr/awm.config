#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SDIR"

CONF=~/.config/awesome
mkdir -p ~/.config

rm -rf "$CONF"
ln -s "$SDIR/awesome" "$CONF"

paru -S --noconfirm \
    awesome-git \
    rofi \
    rofi-greenclip \
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
    nerd-fonts-jetbrains-mono \
    acpid \
    nitrogen \

mkdir -p ~/.local/share/fonts
cp -r ./fonts/* ~/.local/share/fonts
fc-cache -fv
