{ config, pkgs, settings, lib, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    bind=$mod,grave,hyprexpo:expo, toggle
    plugin {
        hyprexpo {
            columns = 3
            gap_size = 5
            bg_col = rgb(${config.lib.stylix.colors.base00})
            workspace_method = center current # [center/first] [workspace] e.g. first 1 or center m+1

            enable_gesture = true # laptop touchpad
            gesture_fingers = 3  # 3 or 4
            gesture_distance = 300 # how far is the "max"
            gesture_negative = true # positive = swipe down. Negative = swipe up.
        }
    }
  '' + lib.optionalString settings.themeDetails.bordersPlusPlus ''
  plugin {
    borders-plus-plus {
        add_borders = 2 # 0 - 9

        # you can add up to 9 borders
        col.border_1 = rgb(${config.lib.stylix.colors.base00})
        col.border_2 = rgb(${config.lib.stylix.colors.base00})

        # -1 means "default" as in the one defined in general:border_size
        border_size_1 = 3
        border_size_2 = 10

        natural_rounding = yes
    }
  }
  ''
  ;
}
