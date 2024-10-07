{ pkgs, lib, config, ...}: {

  options = {
    nh.enable =
      lib.mkEnableOption "enables nix helper";
  };

  config = lib.mkIf config.nh.enable {
    environment.sessionVariables = {
      FLAKE = "/home/mael/nixconf";
    };

    environment.systemPackages = with pkgs; [
      nh
      nix-output-monitor
      nvd
    ];
  };
}
