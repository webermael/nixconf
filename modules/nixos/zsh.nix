{ pkgs, lib, config, ...}: {

  options = {
    zsh.enable =
      lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
}
