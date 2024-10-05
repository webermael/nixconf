{ pkgs, lib, config, ...}: {

  options = {
    systemSound.enable =
      lib.mkEnableOption "enables systemSound";
  };

  config = lib.mkIf config.systemSound.enable {
    hardware.pulseaudio.enable = true;
    services.pipewire.audio.enable = true;
    security.rtkit.enable = true;
  };
}
