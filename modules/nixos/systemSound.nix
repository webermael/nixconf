{ pkgs, lib, config, ...}: {

  options = {
    systemSound.enable =
      lib.mkEnableOption "enables systemSound";
  };

  config = lib.mkIf config.systemSound.enable {
    services.pipewire.audio.enable = true;
    security.rtkit.enable = true;
  };
}
