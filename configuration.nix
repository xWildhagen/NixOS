{ config, pkgs, ... }:

#-------------------------------------------------------------------------------------------
# VARIABLES
#-------------------------------------------------------------------------------------------

let
systemVersion = "24.05";
locale = "nb_NO.UTF-8";

in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  #-------------------------------------------------------------------------------------------
  # SYSTEM
  #-------------------------------------------------------------------------------------------

  # System version
  system.stateVersion = systemVersion;

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Networking
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;
  networking.hostName = "nixos";
  
  # Regional, language and time zone
  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  services.xserver.xkb = {
    layout = "no";
    variant = "winkeys";
  };

  console.keyMap = "no";

  # Sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # Windowing system.
  services.xserver = {
    enable = true;
  };

  # Simple Desktop Display Manager
  services.displayManager.sddm.enable = true;

  # KDE Plasma 6
  services.desktopManager = {
    plasma6.enable = true; 
  };

  # Enable QEMU Guest agent
  services.qemuGuest.enable = true;

  #-------------------------------------------------------------------------------------------
  # USER
  #-------------------------------------------------------------------------------------------
  
  users.users.wildhagen = {
    isNormalUser = true;
    description = "Wildhagen";
    home = "/home/wildhagen";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  #-------------------------------------------------------------------------------------------
  # PACKAGES/PROGRAMS
  #-------------------------------------------------------------------------------------------

  nixpkgs.config.allowUnfree = true;

  # Firefox
  programs.firefox.enable = true;

  # Zsh
  programs.zsh.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    spice-vdagent
    vim
    vscode
    wget
    unzip
    git
    terraform
  ];
}