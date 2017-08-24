# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix              # This file is auto generated by nixos
      /etc/nixos/nixos-configs/core.nix                  # This file defines settings common to every install
      /etc/nixos/nixos-configs/machine.msigx60.nix       # This is machine/hardware/role specific settings
      /etc/nixos/nixos-configs/de.i3-gaps.nix            # This defines the desktop environment to use
      /etc/nixos/nixos-configs/desktop.users.nix         # This is my list of users.
    ];

}
