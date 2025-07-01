#!/usr/bin/env bash
sudo ln -s ~/NixOS/configuration.nix /etc/nixos/configuration.nix
nix-channel --add https://github.com/nix-community/home-manager/archive/release-VERSION.tar.gz home-manager
nix-channel --update
nixos-rebuild switch