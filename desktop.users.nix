{ config, pkgs, ...  }:

{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.matthew = {
    isNormalUser = true;
    uid = 1010;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

}
