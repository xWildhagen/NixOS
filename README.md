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

### Clean up old generations 
```
sudo nix-env --list-generations
sudo nix-collect-garbage --delete-old
```

### Home Manager
```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```