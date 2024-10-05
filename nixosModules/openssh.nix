{ pkgs, lib, config, ...}: {

  options = {
    openssh.enable =
      lib.mkEnableOption "enables openssh";
  };

  config = lib.mkIf config.openssh.enable {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false; #use keys only => change?
      };
    };
  };
}
