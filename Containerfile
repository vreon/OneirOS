# See also: https://github.com/ublue-os/image-template/blob/main/Containerfile

ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG FEDORA_VERSION="39"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${FEDORA_VERSION}

RUN mkdir -p /var/lib/alternatives && \
    ostree contaier commit

RUN wget https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-"${FEDORA_VERSION}"/che-nerd-fonts-fedora-"${FEDORA_VERSION}".repo -O /etc/yum.repos.d/_copr_che-nerd-fonts.repo && \
    wget https://copr.fedorainfracloud.org/coprs/erikreider/SwayNotificationCenter/repo/fedora-"${FEDORA_VERSION}"/erikreider-SwayNotificationCenter-fedora-"${FEDORA_VERSION}".repo -O /etc/yum.repos.d/_copr_erikreider-SwayNotificationCenter.repo && \
    wget https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-"${FEDORA_VERSION}"/solopasha-hyprland-fedora-"${FEDORA_VERSION}".repo -O /etc/yum.repos.d/_copr_solopasha-hyprland.repo && \
    wget https://pkgs.tailscale.com/stable/fedora/tailscale.repo -O /etc/yum.repos.d/tailscale.repo && \
    ostree container commit

RUN rpm-ostree install \
      alacritty \
      blueman \
      brightnessctl \
      fastfetch \
      gnome-keyring \
      gnome-settings-daemon \
      google-noto-sans-fonts \
      grim \
      htop \
      hyprland \
      hyprpaper \
      jetbrains-mono-fonts-all \
      libadwaita \
      mozilla-fira-sans-fonts \
      neovim \
      nerd-fonts \
      network-manager-applet \
      pavucontrol \
      playerctl \
      polkit-gnome \
      powerline-fonts \
      sddm \
      slurp \
      swappy \
      SwayNotificationCenter \
      tailscale \
      thunar \
      thunar-archive-plugin \
      thunar-volman \
      tlp \
      tlp-rdw \
      waybar \
      wofi \
      xdg-desktop-portal-hyprland \
      zsh && \
    ostree container commit
