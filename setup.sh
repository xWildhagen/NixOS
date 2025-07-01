#!/usr/bin/env bash
VERSION=$1

if [ -z "$VERSION" ]; then
echo "Usage: sudo $0 VERSION"
exit 1
fi

sudo ln -s ~/NixOS/configuration.nix /etc/nixos/configuration.nix
nix-channel --add https://github.com/nix-community/home-manager/archive/release-${VERSION}.tar.gz home-manager
nix-channel --update
nixos-rebuild switch