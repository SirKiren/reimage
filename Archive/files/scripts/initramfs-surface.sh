#!/usr/bin/env bash

# mkdir -p /var/tmp mkdir -p /var/roothome
plymouth-set-default-theme details
set -euo pipefail

rpm-ostree cliwrap install-to-root /
QUALIFIED_KERNEL="$(rpm -qa | grep -P 'kernel-surface-(\d+\.\d+\.\d+)' | sed -E 's/kernel-surface-//')"
/usr/libexec/rpm-ostree/wrapped/dracut --no-hostonly --kver "${QUALIFIED_KERNEL}" --reproducible -v --add ostree -f "/lib/modules/${QUALIFIED_KERNEL}/initramfs.img"
