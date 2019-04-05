# My user configuration. This file shouldnt change much.

{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
      guest = { # Guest account, should be setup to wipe on logout
      isNormalUser = true;
      uid = 1000;
    };
    admin = { # Non root automated management account
      isNormalUser = true;
      uid = 1001;
      extraGroups = [ "wheel" "networkmanager" ];
    };
    matthew = { # My account
      isNormalUser = true;
      uid = 1010;
      extraGroups = [ "wheel" "networkmanager" ];
    };
    amalia = {
      isNormalUser = true;
      uid = 1011;
      extraGroups = [ "networkmanager" ];
    };
    America = {
      isNormalUser = true;
      uid = 1012;
      extraGroups = [ "networkmanager" ];
    };
    loriana = {
      isNormalUser = true;
      uid = 1013;
      extraGroups = [ "networkmanager" ];
    };
  };

}
