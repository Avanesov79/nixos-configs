#Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

## Do not include setting that are specific to a particular desktop GUI
##+ configuration or a specific hardware configuration. Use the desktop.xxx.nix
##+ and machine.xxx.nix files for that. This file is for system configuration
##+ that will be consistant across all my installations.

{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n = {
   consoleFont = "Lat2-Terminus16";
   consoleKeyMap = "us";
   defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Archiving utilities
    bzip2 gzip lzip p7zip unzip lzma zip unzip unar
    # System utilities
    wget openssh curl rsync mtr pciutils udiskie
    # System user utilities
    neovim nano ranger atool htop lynx git tree
    # Scripting and programming
    perl python elixir erlang
    # Filesystem support
    exfat ntfs3g zfs btrfs-progs btrfs-dedupe
  ];

  environment.variables = {
    ## Set basic xdg variables
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  programs.bash = {
    enableCompletion = true;
    interactiveShellInit = ''
    ## Source users bashrc file if it exists. This setup moves to/uses the
    ##   XDG base directories.
      if [ -f $XDG_CONFIG_HOME/bash/bashrc ]; then
        . $XDG_CONFIG_HOME/bash/bashrc
      fi
    '';
    loginShellInit = ''
    ## Source users profile.sh file if it exists. This setup moves to/uses the
    ##   XDG base directories. Added the ".sh" to the end to indicate POSIX
    ##   compliance is required since it isnt specific to bash.
      if [ -f $XDG_CONFIG_HOME/profile.sh ]; then
        . $XDG_CONFIG_HOME/bash/profile.sh
      fi
    '';
  };

  # Core services to enable:
  services.openssh.enable = true;
  services.udisks2.enable = true;
}
