{ config, pkgs, settings, inputs, ... }: let
    details = settings.themeDetails;
in {
  home.packages = with pkgs; [
    inputs.swww.packages.${pkgs.system}.swww
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 3440x1440@120, 0x0, 1"
      "HDMI-A-2,1920x1080@120,3440x100, 1"
      "HDMI-A-1,3840x2160@120,-300x-2160, 1"
      #"HDMI-A-1,2560x1440@60,-900x-100, 1.6,transform,3"
      # "eDP-1,1920x1080@60,0x0, 1"
      "eDP-1,2560x1600@120,2560x400, 1.6"
      "DP-3,3840x2160@60,0x0, 1.5"
      "HEADLESS-2,1920x1080@60,-1920x100, 1"
      "HEADLESS-3,1280x800@60,1080x1440, 1"
      "DVI-I-1, 3840x2160@60, 1920x0, 1"
      ",preferred,auto,1"
    ];

    exec-once = [
      "swww-daemon &"
      "ags &"
      # "hyprctl setcursor Catppuccin-Mocha-Lavender-Cursors 24"
      "[workspace 2 silent] firefox"
      "[workspace 3 silent] kitty btop"
      "[workspace 3 silent] kitty ncmpcpp"
      "[workspace 3 silent] kitty cava"
      "steam -nochatui -nofriendsui -silent -vgui"
    ];

    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 2;
      allow_tearing = true;
      "col.active_border" = "rgba(${config.lib.stylix.colors.base0D}ff)";
      "col.inactive_border" = "rgba(${config.lib.stylix.colors.base02}ff)";
    };

    cursor = {
      inactive_timeout = 5;
    };

    decoration = {
      dim_special = 0.5;
      rounding = details.rounding;
      blur = {
        enabled = true;
        special = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
        passes = 3;
        size = 10;
      };

      shadow = {
        enabled = details.shadow;
        ignore_window = false;
        offset = "2 2";
        range = 20;
        color = "rgba(${config.lib.stylix.colors.base00}ff)";
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
        "workIn, 0.72, -0.07, 0.41, 0.98"
      ];
      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
        "specialWorkspace, 1, 5, workIn, slidevert"
      ];
    };

    debug = {
        disable_logs = false;
    };

    input = {
      kb_layout = "us,ru";
      kb_options = "grp:win_space_toggle";
      follow_mouse = true;
      touchpad = {
          natural_scroll = true;
      };
    };

    device = {
        name = "logitech-usb-receiver-mouse";
        sensitivity = -1.0;
    };

    gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 200;
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
      split_width_multiplier = 1.5;
    };

    misc = {
      force_default_wallpaper = -1;
      # vrr = 2;
    };
  };
}
