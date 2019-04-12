# Computer specific configuration goes in this file. Anything that is relative
#+ only to the specific hardware the OS is installed on.

{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mac-desk"; # Define your hostname.

  # Enable the X11 windowing system.
  services.xserver.videoDrivers = [ "nvidiaBeta" ];

environment.systemPackages = with pkgs; [
    vulkan-loader
  ];

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}
