{ inputs, lib, config, pkgs, ... }:
{
  hyprland.enable = true;
  waybar.enable = true;
  zsh.enable = true;
  helix.enable = true;
  ags.enable = true;
  
  home = {
    username = "mael";
    homeDirectory = "/home/mael";
  };

  programs.git = {
    enable = true;
    userName = "webermael";
    userEmail = "webermael7@gmail.com";
  };

  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlux";
  # };

  # fonts.fontconfig.enable = true;
  # home.packages = with pkgs; [
  # 
  # ];


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
