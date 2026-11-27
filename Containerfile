# See also: https://github.com/ublue-os/image-template/blob/main/Containerfile

# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

# Base image: https://github.com/orgs/ublue-os/packages
# Tags: 45 (pinned major), latest (current Fedora), gts (previous Fedora)
FROM ghcr.io/ublue-os/base-main:45

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

# Verify final image and contents are correct
RUN bootc container lint
