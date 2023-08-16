#!/bin/sh

set -oue pipefail

rpm-ostree install tlp tlp-rdw stress-ng
systemctl enable tlp
systemctl enable fprintd.service
