{ pkgs, lib, config, ...}: {

  options = {
    waybar.enable =
      lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;

      systemd = {
        enable = true;
        #target = ?;
      };

      settings = {
        mainBar = {
          layer = "top";
          postition = "top";

          modules-left = [
            "clock" 
            "hyprland/window"
          ];

          modules-center = [
            "hyprland/workspaces"
          ];

          modules-right = [
            "pulseaudio"
            "hyprland/language" 
            "network"
            "memory" 
            "cpu" 
            "battery"
          ];

          "clock" = {
            format = "{:%H:%M}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              weeks-pos = "right";
              on-scroll = 1;
              format = {
                months = "<span color='#ffead3'><b>{}</b></span>";
                days = "<span color='#ecc6d9'><b>{}</b></span>";
                weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };

            actions = {
              #on-click-right = "mode";
              on-click-middle = "shift_reset";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };

          "hyprland/window" = {
            separate-outputs = true;
          };

          "hyprland/workspaces" = {
            active-only = true;
            format = "{}";
          };

          "hyprland/language" = {
            format = "{short}  ";
          };

          "network" = {
            format = "{ifname}";
            tooltip-format = "{ifname}";
            format-wifi = "{essid} ({signalStrength}%)  ";
            tooltip-format-wifi = "{essid} ({signalStrength}%)  ";
            format-ethernet = "{ipaddr}/{cidr} 󰈀 ";
            tooltip-format-ethernet = "{bandwidthTotalBytes} 󰈀 ";
            format-disconnected = "No connection 󰖪 ";
            tootip-format-disconnected = "No connection 󰖪 ";
          };

          "memory" = {
            format = "{used} Gib ({percentage}%) 󰍛 ";
          };

          "cpu" = {
            format = "{usage}%  ";
          };

          "battery" = {
            format = "{capacity}% {icon} ";
            format-icons = ["" "" "" "" ""];
          };
        };

      };

      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: "Fira Code", sans-serif;
          font-size: 13px;
        }
      '';
    };
  };
}
