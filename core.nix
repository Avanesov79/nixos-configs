# This file should contain core packages and settings I want on every system.

{ config, pkgs, ...  }:

{

 # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    neovim
    tree
    rsync
    openssh
    htop
    mtr
    ranger
    elixir
    udiskie
    lynx
    git
    git-radar
    xorg.xmodmap
    bzip2
    gzip
    lzip
    p7zip
    unzip
    lzma
    zip
    unzip
    unar
  ];


  ##### List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.udisks2.enable = true;

  # Allow unfree software for proprietary hardware and drivers
  nixpkgs.config.allowUnfree = true;

  # The NixOS release to be compatible with for stateful data such as databases.
    system.stateVersion = "17.03";

}
