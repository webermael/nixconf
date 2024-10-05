{ pkgs, lib, config, ...}: {

  options = {
    systemSound.enable =
      lib.mkEnableOption "enables systemSound";
  };

  config = lib.mkIf config.systemSound.enable {
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

  };
}
