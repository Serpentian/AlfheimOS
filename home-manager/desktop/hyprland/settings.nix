{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, 3440x1440@120, 0x0, 1"
      "HDMI-A-1,1920x1080@120,3440x100, 0.83"
    ];

    exec-once = [
      "waybar"
    ];
    
    general = {
      gaps_in = 5;
      gaps_out = 15;
      border_size = 2;
      "col.active_border" = "rgba(88888888)";
      "col.inactive_border" = "rgba(00000088)";
      allow_tearing = false;
    };

    decoration = {
      rounding = 15;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
        passes = 3;
        size = 10;
      };

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 2";
      shadow_range = 20;
      shadow_render_power = 3;
      "col.shadow" = "rgba(00000055)";
    };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
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
      ];
    };

    input = {
      kb_layout = "us,ru";
      kb_options = "grp:win_space_toggle";
      follow_mouse = false;
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = -1;
    };
  };
}
