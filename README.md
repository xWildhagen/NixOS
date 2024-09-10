# NixOS

### Get new config from GitHub
```
sudo rm /etc/nixos/configuration.nix
nix-shell -p git --run "git clone https://github.com/xWildhagen/NixOS.git"
sudo ln -s ~/NixOS/configuration.nix /etc/nixos/configuration.nix
```

### Pull changes from GitHub
```
git -C NixOS pull
```

### Rebuild NixOS
```
sudo nixos-rebuild switch --upgrade
```

### Update NixOS
```
sudo nix-channel --update
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