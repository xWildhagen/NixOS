# NixOS

### Get new config from GitHub
```
nix-shell -p git --run "git clone https://github.com/xWildhagen/NixOS.git"
sudo cp -r NixOS/* /etc/nixos
```

### Pull changes from GitHub
```
nix-shell -p git --run "git -C NixOS pull"
sudo cp -r NixOS/* /etc/nixos
```

### Rebuild NixOS
```
sudo nixos-rebuild switch
```

### Clean up old generations 
```
sudo nix-env --list-generations
sudo nix-collect-garbage --delete-old
```