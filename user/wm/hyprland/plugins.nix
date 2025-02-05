{ config, pkgs, settings, lib, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
        dynamic-cursors {
            enabled = true
            mode = stretch
            threshhold = 1
            stretch {
                limit = 1500
                # linear, quadratic, negative_quadratic
                function = linear
            }
            shake {
                enabled = true
                # use nearest-neighbour (pixelated) scaling when shaking
                # may look weird when effects are enabled
                nearest = true
                # controls how soon a shake is detected
                # lower values mean sooner
                threshold = 5.0
                # magnification level immediately after shake start
                base = 4.0
                # magnification increase per second when continuing to shake
                speed = 5.0
                # how much the speed is influenced by the current shake intensitiy
                influence = 0.0
                # maximal magnification the cursor can reach
                # values below 1 disable the limit (e.g. 0)
                limit = 0.0
                # time in millseconds the cursor will stay magnified after a shake has ended
                timeout = 2000
                # show cursor behaviour `tilt`, `rotate`, etc. while shaking
                effects = false
                # enable ipc events for shake
                # see the `ipc` section below
                ipc = false
            }
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
