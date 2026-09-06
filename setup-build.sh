#!/usr/bin/env bash
set -e

script_path=${BASH_SOURCE[0]}
repo_root=$(CDPATH= cd -- "$(dirname -- "$script_path")" && pwd)
poky_dir="$repo_root/poky"
build_dir="$repo_root/build"

if [ ! -f "$poky_dir/oe-init-build-env" ]; then
    git -C "$repo_root" submodule update --init --recursive
fi

if [ ! -f "$poky_dir/oe-init-build-env" ]; then
    printf '%s\n' "poky submodule is unavailable; check the submodule URL and network connection." >&2
    exit 1
fi

if ! grep -q '^MACHINE = "beaglebone-yocto"$' "$build_dir/conf/local.conf"; then
    printf '%s\n' "build/conf/local.conf must set MACHINE = \"beaglebone-yocto\"." >&2
    exit 1
fi

# shellcheck disable=SC1091
source "$poky_dir/oe-init-build-env" "$build_dir"

printf '%s\n' "Yocto build environment ready for beaglebone-yocto."
printf '%s\n' "Build an image with: bitbake core-image-minimal"