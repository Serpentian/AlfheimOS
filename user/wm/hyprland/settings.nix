{ custom, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    swww
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 3440x1440@120, 0x0, 1"
      "HDMI-A-2,1920x1080@120,3440x100, 1"
      # "eDP-1,1920x1080@60,0x0, 1"
      "eDP-1,2560x1600@120,0x0, 1.333333"
      "HEADLESS-2,1920x1080@60,-1920x100, 1"
      "HEADLESS-3,1280x800@60,1080x1440, 1"
      ",preferred,auto,1"
    ];

    exec-once = [
      "ags &"
      # "hyprctl output create headless"
      # "wayvnc -S /tmp/wayvnc-1 -g -o HEADLESS-2 -f 60 -d 0.0.0.0 5900"
      # "hyprctl output create headless"
      # "wayvnc -S /tmp/wayvnc-2 -g -o HEADLESS-3 -f 60 -d 0.0.0.0 5901"
      # TODO: manage cursors in Nix
      "hyprctl setcursor Catppuccin-Mocha-Lavender-Cursors 24"
      "[workspace 1 silent] firefox"
      "[workspace 2 silent] kitty btop"
      "[workspace 2 silent] kitty spotify_player"
      "[workspace 2 silent] kitty cava"
    ];

    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 3;
      "col.active_border" = "rgba(${custom.primary_accent}50) rgba(${custom.secondary_accent}50) 45deg";
      "col.inactive_border" = "rgba(00000000)";
      allow_tearing = true;
    };

    decoration = {
      dim_special = 0.5;
      rounding = 25;
      blur = {
        enabled = true;
        special = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
        passes = 3;
        size = 10;
      };

      drop_shadow = false;
      shadow_ignore_window = true;
      shadow_offset = "2 2";
      shadow_range = 20;
      shadow_render_power = 3;
      "col.shadow" = "rgba(000000b2)";
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
      vrr = 2;
    };
  };
}
