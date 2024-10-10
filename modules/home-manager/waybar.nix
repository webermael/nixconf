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
          color: #ffffff;
        }

        window#waybar {
          background: transparent;
        }

        /* --- WORKSPACEAS --- (fix colors / styling)*/
        #workspaces {
          background: #ffffff;
          margin: 2px 1px 3px 1px;
          padding: 0px 1px;
          border-radius: 15px;
          border: 0px;
          font-weight: bold;
          font-style: normal;
          opacity: 0.8;
          font-size: 14px;
          color: #000000;
        }

        #workspaces button {
          padding: 0px 5px;
          margin: 4px 3px;
          border-radius: 15px;
          border: 0px;
          color: #000000;
          background-color: #808080;
          transition: all 0.3s ease-in-out;
          opacity: 0.4;
        }

        #workspaces button.active {
          color: #000000;
          background-color: #808080;
          border-radius: 15px;
          min-width: 40px;
          transition: all 0.3s ease-in-out;
          opacity:1.0;
        }

        #workspaces button:hover {
          color: #000000;
          background-color: #404040;
          border-radius: 15px;
          opacity:0.7;
        }

        /* --- TOOLTIP --- */
        tooltip {
          border-radius: 10px;
          background-color: #ffffff;
          opacity: 0.7;
          padding: 20px;
          margin: 0px;
        }

        tooltip label {
          color: #000000;
        }

        /* --- WINDOW --- */
        #window {
          background-color: #ffffff;
          margin: 5px 15px 5px 0px;
          padding: 2px 10px 0px 10px;
          border-radius: 12px;
          color: #000000;
          opacity: 0.8;
        }

        #window#waybar.empty #window {
          background-color: transparent;
        }
      '';
    };
  };
}
