# Machine specific settings go here.

{ config, pkgs, ... }:
{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "matthew-nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.networkmanager.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.opengl.driSupport32Bit = true;
  services.xserver.videoDrivers = [ "nvidia" "vesa"  ];

}
