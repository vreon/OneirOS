# See also: https://github.com/ublue-os/image-template/blob/main/Containerfile

ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG FEDORA_VERSION="42"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${FEDORA_VERSION}

RUN mkdir -p /var/lib/alternatives && \
    ostree container commit

RUN wget https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-"${FEDORA_VERSION}"/che-nerd-fonts-fedora-"${FEDORA_VERSION}".repo -O /etc/yum.repos.d/_copr_che-nerd-fonts.repo && \
    wget https://copr.fedorainfracloud.org/coprs/erikreider/SwayNotificationCenter/repo/fedora-"${FEDORA_VERSION}"/erikreider-SwayNotificationCenter-fedora-"${FEDORA_VERSION}".repo -O /etc/yum.repos.d/_copr_erikreider-SwayNotificationCenter.repo && \
    wget https://copr.fedorainfracloud.org/coprs/yalter/niri-git/repo/fedora-"${FEDORA_VERSION}"/yalter-niri-git-fedora-"${FEDORA_VERSION}".repo -O /etc/yum.repos.d/_copr_yalter-niri-git.repo && \
    wget https://copr.fedorainfracloud.org/coprs/ulysg/xwayland-satellite/repo/fedora-"${FEDORA_VERSION}"/ulysg-xwayland-satellite-fedora-"${FEDORA_VERSION}".repo -O /etc/yum.repos.d/_copr_ulysg-xwayland-satellite.repo && \
    wget https://pkgs.tailscale.com/stable/fedora/tailscale.repo -O /etc/yum.repos.d/tailscale.repo && \
    ostree container commit

# Remove firefox package in favor of Flatpak
RUN rpm-ostree uninstall \
      firefox \
      firefox-langpacks && \
    ostree container commit

RUN rpm-ostree install \
      alacritty \
      blueman \
      brightnessctl \
      clang-devel \
      fastfetch \
      gnome-keyring \
      gnome-settings-daemon \
      google-noto-sans-fonts \
      grim \
      htop \
      jetbrains-mono-fonts-all \
      libadwaita \
      mozilla-fira-sans-fonts \
      nautilus \
      neovim \
      nerd-fonts \
      network-manager-applet \
      niri \
      pavucontrol \
      playerctl \
      polkit \
      powerline-fonts \
      sddm \
      slurp \
      swappy \
      swaybg \
      SwayNotificationCenter \
      tailscale \
      thunar \
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
      zsh && \
    ostree container commit
