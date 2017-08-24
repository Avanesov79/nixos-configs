# Settings specific to an i3-gaps desktop environment go here:

{ config, pkgs, ... }:
{

  # Enable the i3-gaps Desktop Environment.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "";
   # displayManager.lightdm.enable = true;
    #windowManager.i3.enable = true;
    #windowManager.i3.package = pkgs.i3-gaps;
    windowManager.awesome.enable = true;
    };
  # Set packages to be installed
  environment.systemPackages = with pkgs; [
##### Packages specific to the i3 desktop setup I want #####
############################################################
##### Programs #####
    emacs                               # GUI based text editor with cli option, use with spacemacs mods from git
    termite                             # Better terminal emulator that urxvt? Trying it out.
    chromium                            # GUI Webbrowser
    handbrake                           # DVD ripper
    gimp                                # Image manipulation and drawing program
    gwenview                            # Image viewer
    nitrogen                            # wallpaper selector and restorer
    irssi                               # IRC client
    mpv                                 # Video player
    moc                                 # Audio player
    rxvt_unicode                        # Preferred terminal emulator
##### System Utilities 
    awesome
    i3lock                              # Screen lock program
#    i3blocks-gaps                       # i3 wm with gaps support
    compton                             # Compositor for use with i3
    rofi                                # Program runner/launcher
    rofi-menugen                        # Menu generator for rofi
  #  lxqt.compton-conf                   # GUI config tool for compton
    lxqt.pcmanfm-qt                     # qt based file manager
    pavucontrol                         # Volume control for pulse audio
    networkmanager                      # network manager- use nmtui for ncurses interface
    networkmanagerapplet                # Applet for NM for connection info in the status bar.
    playerctl                           # Allows binding keys to commands for media player control
    arandr                              # GUI frontend to xrandr for multi-monitor configuration
    lxappearance                        # theme configuration for gtk2 and gtk3 window decoration
  #  qt5ct                               # Theme configuration for qt based applications
    ];
  ##### List services that you want to enable:
  hardware.pulseaudio.enable = true;
}
