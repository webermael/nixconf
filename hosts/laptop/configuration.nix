{ inputs, lib, config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  general.enable = true;
  systemSound.enable = true;
  bluetooth.enable = true;
  nh.enable = true;
  zsh.enable = true;
  sddm.enable = true;
  
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

  # modularize ?
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
  };

  #hardware.graphics.enable = true;

  # modularize!!!
  programs.hyprland.enable = true;
  #programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  
  system.stateVersion = "24.11";
}
