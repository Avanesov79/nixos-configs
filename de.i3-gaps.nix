# Settings specific to an i3-gaps desktop environment go here:

{ config, pkgs, ... }:
{

  # Enable the i3-gaps Desktop Environment.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "";
    displayManager.sddm.enable = true;
    windowManager.i3.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
    };
  # Set packages to be installed
  environment.systemPackages = with pkgs; [
##### Packages specific to the i3 desktop setup I want #####
############################################################
##### Programs #####
    chromium                            # GUI Webbrowser
    handbrake                           # DVD ripper
    gimp                                # Image manipulation and drawing program
    gwenview                            # Image viewer
    nitrogen                            # wallpaper selector and restorer
    irssi                               # IRC client
    mpv                                 # Video player
    moc                                 # Audio player
    rxvt_unicode                        # Preferred terminal emulator
##### System Utilities #####
    i3lock                              # Screen lock program
    i3blocks-gaps                       # i3 wm with gaps support
    #i3status                           # Status info for i3-bar (using i3blocks instead)
    compton                             # Compositor for use with i3
    rofi                                # Program runner/launcher
    rofi-menugen                        # Menu generator for rofi
    lxqt.compton-conf                   # GUI config tool for compton
    lxqt.pcmanfm-qt                     # qt based file manager
    pavucontrol                         # Volume control for pulse audio
    networkmanager                      # network manager- use nmtui for ncurses interface
    pulseaudioFull                      # Pulse audio sound server
    playerctl                           # Allows binding keys to commands for media player control
    arandr                              # GUI frontend to xrandr for multi-monitor configuration
    lxappearance                        # theme configuration for gtk2 and gtk3 window decoration
##### Icons, Themes, and Wallpapers #####
    ## Fonts
    dejavu_fonts
    freefont_ttf
    google-fonts
    nerdfonts
    font-awesome-ttf                    # Fonts
    oxygenfonts
    ## Theme Pack (window decorations)
    arc-theme                           # gtk theme
    gnome-breeze                        # gtk theme to match kde breeze
    adapta-gtk-theme
    flat-plat
    numix-gtk-theme
    paper-gtk-theme
    ## Wallpapers
    plasma-workspace-wallpapers         # Wallpaper pack
    nixos-artwork
    ## Cursor themes
    xorg.xcursorthemes                  # cursor theme
    ## Icon Themes
    arc-icon-theme                      # Icon theme
    kdeFrameworks.oxygen-icons5         # Icon theme
    hicolor_icon_theme                  # Icon theme
    moka-icon-theme                     # Icon theme
    xfce.xfce4icontheme                 # Icon Theme
    elementary-icon-theme               # Icon theme
    faba-icon-theme
    gnome2.gnome_icon_theme
    maia-icon-theme
    mate.mate-icon-theme
    mate.mate-icon-theme-faenza
    numix-icon-theme
    numix-icon-theme-circle
    numix-icon-theme-square
    paper-icon-theme
    tango-icon-theme
    ];
  ##### List services that you want to enable:
  hardware.pulseaudio.enable = true;
}
