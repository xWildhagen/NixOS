# NixOS

### Get new config from GitHub
```
sudo rm /etc/nixos/configuration.nix
nix-shell -p git --run "git clone https://github.com/xWildhagen/NixOS.git"
sudo ln -s ~/NixOS/configuration.nix /etc/nixos/configuration.nix
```

### Pull changes from GitHub
```
nix-shell -p git --run "git -C NixOS pull"
git -C NixOS pull
```

### Rebuild NixOS
```
sudo nixos-rebuild switch --upgrade
```

### Clean up old generations 
```
sudo nix-env --list-generations
sudo nix-collect-garbage --delete-old
```