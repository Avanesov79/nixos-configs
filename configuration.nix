# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Only the machine specific and desktop entries should
      #+ change across installs.
      ./hardware-configuration.nix ## Created by automatic hardware scan.
      ./core.nix                   ## Packages I want on every system.
      ./users.nix                  ## My system users
      ./machine.mac-desk.nix       ## Machine specific configuration
      ./desktop.kde.nix            ## GUI desktop environment
    ];
}
