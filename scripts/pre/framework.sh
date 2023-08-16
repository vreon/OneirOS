#!/bin/sh

set -oue pipefail

rpm-ostree install tlp tlp-rdw stress-ng
rpm-ostree override remove power-profiles-daemon
systemctl enable tlp
systemctl enable fprintd.service
