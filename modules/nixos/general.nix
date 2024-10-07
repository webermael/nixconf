{ pkgs, lib, config, ...}: {

  options = {
    general.enable =
      lib.mkEnableOption "general settings";
  };

  config = lib.mkIf config.general.enable {
    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };

    nix.settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };

    time.timeZone = "Europe/Zurich";
    console.keyMap = "us-acentos";

    environment.systemPackages = with pkgs; [
      neovim
      tldr
      wget
      curl
      git
      gh
    ];
  };
}
