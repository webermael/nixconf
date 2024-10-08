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
        general = {
          border_size = 3;
          gaps_in = 5;
          gaps_out = 10;

          resize_on_border = true;
        };

        decoration = {
          rounding = 5;
          active_opacity = 1.0; # maybe try out?
          inactive_opacity = 0.6; # nice?
          fullscreen_opacity = 1.0;

          #dim_inactive = true; # nice?

          blur = {
            size = 5; # default: 8
          };
        };

        misc = {
          #disable_hyprland_logo = true;
          disable_splash_rendering = true;
          force_default_wallpaper = 0; 
        };

        "$mod" = "SUPER";        
        bind = [
	        # --- APPLICATION SHORTCUTS ---
          "$mod, return, exec, kitty"
          "$mod, B, exec, firefox"
          "$mod SHIFT, Q, killactive,"
          "$mod SHIFT, M, exit,"
          "$mod, F, fullscreen,"

	        # --- WINDOWS ---
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"
	  
          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"

          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
        ];
      };
    };

  };
}
