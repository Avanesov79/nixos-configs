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
    xorg.xmodmap                                     # xmodmap modifies keymaps and pointer buttons in xorg
    mtr                                              # My Trace Route is a combination of ping and traceroute for network diagnostics
    udiskie                                          # Auto-mounting software for removable storage and media
    wget                                             # Download files using HTTP, HTTPS and FTP
    neovim                                           # My preferred text editor launched with nvim command
    tree                                             # Prints an ASCII tree of directory structure
    rsync                                            # Local and remote file sync software
    openssh                                          # Remote connection software
    htop                                             # A better process manager (replaces top)
    ranger                                           # Ncurses file and directory manager with vim-like key commands
    elixir                                           # Functional programming language with ruby-like syntax and runs on the erlang vm
    lynx                                             # Ncurses web browser
    git                                              # Version control for software sources
    git-radar                                        # HUD for git on the command line
  ];

  ##### List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.udisks2.enable = true;

  # Allow unfree software for proprietary hardware and drivers
  nixpkgs.config.allowUnfree = true;

  # The NixOS release to be compatible with for stateful data such as databases.
    system.stateVersion = "17.03";

  # Enable zsh as a user shell and setup basic configuration
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    loginShellInit = ''  ## Setup login configuration
umask 027  # Set umask for default permissions in the home folder
## Set basic xdg variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
## Set user xdg variables
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"
## Set some custom variables
export LOGIN_SCRIPTS="$HOME/.config/scripts/login.d"
export ITERM_SCRIPTS="$HOME/.config/scripts/interactive.d"
export LOGOUT_SCRIPTS="$HOME/.config/scripts/logout.d"
export EDITOR=nvim

## Verify all folder paths exist and create them if they dont
folderdirs=(
  $XDG_CONFIG_HOME
  $XDG_CACHE_HOME
  $XDG_DATA_HOME
  $XDG_DESKTOP_DIR
  $XDG_DOCUMENTS_DIR
  $XDG_DOWNLOAD_DIR
  $XDG_MUSIC_DIR
  $XDG_PICTURES_DIR
  $XDG_PUBLICSHARE_DIR
  $XDG_TEMPLATES_DIR
  $XDG_VIDEOS_DIR
  $LOGIN_SCRIPTS
  $ITERM_SCRIPTS
  $LOGOUT_SCRIPTS
  $HOME/.local/bin
  $HOME/bin
  )
for dir in $folderdirs; do
  if [ ! -d $dir ]; then
    mkdir -p $dir
  fi
done
unset folderdirs

## List directories to be added to $PATH
pathdirs=(
  $HOME/.local/bin
  $HOME/bin
)
#-------
# DESC: Adds a directory to the PATH if it's not already in the PATH
# ARGS:
#  1 - The directory to add
#  2 - Which end of PATH to add to.  Use "front" to prepend.
#-------
add2path() {
  setopt shwordsplit
  present=0
  for pathdir in $path; do
    if [[ $pathdir = $1 ]]; then
      present=1
    fi
  done
  if [[ $present = 0 ]]; then
    if [[ $2 = "front" ]]; then
      PATH="$1:$PATH"
    else
      PATH="$PATH:$1"
    fi
    export PATH
  fi
}

 ## Add only the listed directories that do not already exist
for dir in $pathdirs; do
  if [ -d $dir ]; then
    add2path $dir back
  fi
done
unset pathdirs

 ## Source all .zsh files within a specified directory on login
if [ -d $LOGIN_SCRIPTS ]; then
  for i in $LOGIN_SCRIPTS/*.zsh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
    '';
    };
}
