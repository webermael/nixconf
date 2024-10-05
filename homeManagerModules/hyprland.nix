{ pkgs, lib, config, ...}: {

  options = {
    hyprland.enable =
      lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.firefox.enable = true;
    programs.kitty.enable = true;
    
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "mod" = "SUPER";        
        bind = [
          "$mod, return, exec, kitty"
          "$mod, B, exec, firefox"
          "$mod, SHIFT, Q, killactive,"
          "$mod SHIFT, M, exit,"
          "$mod, F, fullscreen,"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"

          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
        ]       
      };
    };

  };
}
