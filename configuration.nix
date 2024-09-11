{ config, pkgs, ... }:

#-------------------------------------------------------------------------------------------
# VARIABLES
#-------------------------------------------------------------------------------------------

let
  version = "24.11";
  locale = "nb_NO.UTF-8";
  user = "wildhagen";
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      <home-manager/nixos>
    ];

  #-------------------------------------------------------------------------------------------
  # SYSTEM
  #-------------------------------------------------------------------------------------------

  # System version
  system.stateVersion = version;

  # Auto update
  system.autoUpgrade.enable = true;

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Enable QEMU Guest agent
  services.qemuGuest.enable = true;

  # Networking
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;
  networking.hostName = "nixos";
  
  # Regional, language and time zone
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_US.UTF-8";
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

  services.greetd = {
    enable = true;
    greeterSession = "agreety";
    defaultSession = "${pkgs.hyprland}/bin/Hyprland";  
  };

  #-------------------------------------------------------------------------------------------
  # USER
  #-------------------------------------------------------------------------------------------
  
  users.users.${user} = {
    isNormalUser = true;
    description = "Wildhagen";
    home = "/home/wildhagen";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" ];
    initialPassword = user;
    packages = with pkgs; [
      hyprland
    ];
  };

  #-------------------------------------------------------------------------------------------
  # PACKAGES/PROGRAMS
  #-------------------------------------------------------------------------------------------

  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    spice-vdagent
    hyprland
    agreety
    firefox
    vscode
    git
    vim
    wget
    unzip
    terraform
    rclone
  ];

  #-------------------------------------------------------------------------------------------
  # HOME MANAGER
  #-------------------------------------------------------------------------------------------

  home-manager.users.${user} = { pkgs, ... }: {
    home.stateVersion = version;

    home.packages = with pkgs; [
      hyprland
      waybar  # Recommended for status bars in Hyprland
      wofi    # A Wayland launcher
      grim    # Screenshot tool for Wayland
      slurp   # Select area of screen
    ];

    # Hyprland config in Home Manager
    home.file.".config/hypr/hyprland.conf".text = ''
      # Example Hyprland configuration
      monitor=HDMI-A-1,1920x1080@60,0x0,1.0
      input {
        kb_layout = "no"
      }
      # Other Hyprland specific settings...
    '';
  };
}