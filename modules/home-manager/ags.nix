{ pkgs, lib, config, inputs, ...}: {

  imports = [ inputs.ags.homeManagerModules.default ];

  options = {
    ags.enable =
      lib.mkEnableOption "enables ags";
  };

  config = lib.mkIf config.ags.enable {
    programs.ags = {
      enable = true;
      configDir = ./ags;
    };
  };
}
