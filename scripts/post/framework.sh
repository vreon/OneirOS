#!/bin/sh

set -oue pipefail

systemctl enable tlp
systemctl enable fprintd.service
