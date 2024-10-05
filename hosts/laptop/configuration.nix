{ inputs, lib, config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
  ];

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

  # change / modularize?
  environment.systemPackages = with pkgs; [
    pavucontol
    neovim
    tldr
    wget
    git
    gh
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  # switch to grub?
  boot.loader.systemd-boot.enable = true;

  users.users = {
    mael = {
      initialPassword = "mael";
      isNormalUser = true;
      # add SSH keys
      #openssh.authorizedKeys.keys = [];
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false; #use keys only => change?
    };
  };

  hardware.opengl = {
    enable = true;
  }
  
  #system.stateVersion = "23.11"; -> check why this is necesary
}
