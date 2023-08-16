#!/bin/sh

set -oue pipefail

rpm-ostree install tlp tlp-rdw stress-ng
