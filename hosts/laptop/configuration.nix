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
  };

  # modularize!!!
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  
  #system.stateVersion = "23.11"; -> check why this is necesary
}
