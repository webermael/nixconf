{ inputs, outputs, lib, config, pkgs, ...}:
{
  imports = [
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "mael";
    homeDirectory = "/home/mael";
  };

  # fonts.fontconfig.enable = true;
  # home.packages = with pkgs; [
  # 
  # ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "webermael";
    userEmail = "webermael7@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  system.stateVersion = "23.11";
}
