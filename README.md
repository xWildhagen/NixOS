# NixOS

### Initial setup

```
sudo loadkeys no
nix-shell -p git --run "git clone https://github.com/xwildhagen/nixos.git"
sudo chmod +x nixos/setup.sh
sudo nixos/setup.sh VERSION
```

### Pull changes from GitHub

```
nix-shell -p git --run "git -C nixos reset --hard && git -C nixos pull"
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

## Unstable version

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
