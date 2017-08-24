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
  ##### Installed Packages #####
    bzip2 gzip lzip p7zip unzip lzma zip unzip unar  #Archiving utilities
    pciutils                                         # pci bus information utility
    mtr                                              # My Trace Route is a combination of ping and traceroute for network diagnostics
    udiskie                                          # Auto-mounting software for removable storage and media
    wget                                             # Download files using HTTP, HTTPS and FTP
    neovim                                           # My preferred text editor launched with nvim command
    rsync                                            # Local and remote file sync software
    openssh                                          # Remote connection software
    htop                                             # A better process manager (replaces top)
    ranger                                           # Ncurses file and directory manager with vim-like key commands
    atool                                            # Used by the ranger file manager
    lynx                                             # Ncurses web browser
    git                                              # Version control for software sources
    tree                                             # cmdline utility to display a directory structure in ascii
    xorg.xmodmap                                     # Allows rebinding keystrokes to different keys, e.g. swapping esc and caps-lock
    ## Shells I want available, fish is set default in user configuration ##
    zsh                                              # z-shell
    fish                                             # fish shell
    dash                                             # dash shell
    bash                                             # bash shell, should be installed by default but specifying anyway.
    ## Scripting/programming languages I want available ##
    perl                                             # perl seems to be included in base but im specifying it anyway
    python                                           # I want python because it is used frequently by other programs
    elixir                                           # Functional programming language with ruby-like syntax and runs on the erlang vm
    erlang                                           # Add this so it isnt a hidden dependancy of elixir
    ## Filesystem support ##
    exfat
    ntfs3g
    zfs
    btrfs-progs                                      # Utilities for the btrfs filesystem
    btrfs-dedupe                                      # btrfs deduplication utility
  ];
  ## Set global environment variables
  environment.variables = {
    ## Set basic xdg variables
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    ## Set user xdg variables
    XDG_DESKTOP_DIR = "$HOME/Desktop";
    XDG_DOCUMENTS_DIR = "$HOME/Documents";
    XDG_DOWNLOAD_DIR = "$HOME/Downloads";
    XDG_MUSIC_DIR = "$HOME/Music";
    XDG_PICTURES_DIR = "$HOME/Pictures";
    XDG_PUBLICSHARE_DIR = "$HOME/Public";
    XDG_TEMPLATES_DIR = "$HOME/Templates";
    XDG_VIDEOS_DIR = "$HOME/Videos";
    ## Set some custom variables
    ZDOTDIR = "$HOME/.config/zsh";
    HISTFILE = "$ZDOTDIR/histfile";
    ## The following are not valid XDG variables but I wanted to stay consistent
    ##   with previous $HOME directory variable assignments.
    XDG_PROGRAMS_DIR = "$HOME/.local/programs"; 
    XDG_PROJECTS_DIR = "$HOME/Projects";
  };



  ##### List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.udisks2.enable = true;
  programs.fish.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/fish";
  services.emacs.enable = true;

  # Allow unfree software for proprietary hardware and drivers
  nixpkgs.config.allowUnfree = true;

  # The NixOS release to be compatible with for stateful data such as databases.
    system.stateVersion = "17.03";
}
