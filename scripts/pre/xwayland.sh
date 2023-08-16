#!/bin/sh
# See also: https://github.com/solopasha/hyprlandRPM/issues/3

rpm-ostree override \
  replace xorg-x11-server-Xwayland \
  --experimental \
  --from repo='copr:copr.fedorainfracloud.org:solopasha:hyprland'
