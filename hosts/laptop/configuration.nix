{ inputs, lib, config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  general.enable = true;
  sound.enable = true;
  bluetooth.enable = true;
  
  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  # switch to grub?
  boot.loader.systemd-boot.enable = true;

  users.users = {
    mael = {
      initialPassword = "mael";
      isNormalUser = true;
      # add SSH keys
      #openssh.authorizedKeys.keys = [];
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  hardware.opengl = {
    enable = true;
  }
  
  #system.stateVersion = "23.11"; -> check why this is necesary
}
