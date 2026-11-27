#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Third-party repos

dnf5 -y copr enable che/nerd-fonts
curl -fsSL https://pkgs.tailscale.com/stable/fedora/tailscale.repo \
    -o /etc/yum.repos.d/tailscale.repo

### Packages

# Remove firefox package in favor of Flatpak
dnf5 -y remove firefox firefox-langpacks || true

dnf5 -y install \
    alacritty \
    blueman \
    brightnessctl \
    clang-devel \
    fastfetch \
    fprintd \
    fprintd-pam \
    gnome-keyring \
    gnome-settings-daemon \
    google-noto-sans-fonts \
    grim \
    htop \
    jetbrains-mono-fonts-all \
    libadwaita \
    nautilus \
    neovim \
    nerd-fonts \
    network-manager-applet \
    niri \
    pavucontrol \
    playerctl \
    polkit \
    polkit-kde \
    powerline-fonts \
    sddm \
    slurp \
    swappy \
    swaybg \
    SwayNotificationCenter \
    tailscale \
    Thunar \
    thunar-archive-plugin \
    thunar-volman \
    tlp \
    tlp-rdw \
    waybar \
    wofi \
    xcb-util-cursor-devel \
    xdg-desktop-portal-gnome \
    xdg-desktop-portal-gtk \
    xwayland-run \
    xwayland-satellite \
    zsh

### Cleanup

# Disable third-party repos so they don't end up enabled on the final image
dnf5 -y copr disable che/nerd-fonts
sed -i 's/^enabled=1/enabled=0/' /etc/yum.repos.d/tailscale.repo
