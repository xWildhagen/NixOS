# NixOS

### Initial setup

```
sudo loadkeys no
sudo rm /etc/nixos/configuration.nix
nix-shell -p git --run "git clone https://github.com/xWildhagen/NixOS.git"
sudo NixOS/setup.sh
sudo ln -s ~/NixOS/configuration.nix /etc/nixos/configuration.nix
nix-channel --add https://github.com/nix-community/home-manager/archive/release-VERSION.tar.gz home-manager
nix-channel --update
nixos-rebuild switch
```

### Pull changes from GitHub

```
nix-shell -p git --run "git -C NixOS pull"
```

### Rebuild NixOS

```
sudo nixos-rebuild switch
```

### Update NixOS

```
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
```

### List generations

```
sudo nix-env --list-generations
```

### Clean up old generations

```
sudo nix-collect-garbage --delete-old
```

### Unstable version of NixOS

```
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
```

### Unstable version of Home Manager

```
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
```
