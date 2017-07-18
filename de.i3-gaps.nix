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
    i3lock
    i3blocks-gaps
    i3status
    nitrogen
    lxqt.pcmanfm-qt
    kdeFrameworks.oxygen-icons5
    pavucontrol
    networkmanager
    irssi
    rxvt_unicode
    mpv
    moc
    pulseaudioFull
    playerctl
    arandr
    font-awesome-ttf
    lxappearance
    arc-theme
    arc-icon-theme
    plasma-workspace-wallpapers
    xorg.xcursorthemes
    moka-icon-theme
    rofi
    rofi-menugen
    compton
    lxqt.compton-conf
##### Packages I want on every GUI desktop system #####
    chromium
    handbrake
    ];
  ##### List services that you want to enable:
  hardware.pulseaudio.enable = true;
}
