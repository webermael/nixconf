{ pkgs, lib, config, ...}: {

  options = {
    helix.enable =
      lib.mkEnableOption "enables helix";
  };

  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;

      settings = {
      	theme = "catppuccin_mocha";
      	editor.line-number = "relative";
      };
    };
  };
}
