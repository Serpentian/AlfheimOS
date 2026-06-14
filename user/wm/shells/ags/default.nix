{ inputs, pkgs, settings, lib, config, ... }: let
    details = settings.themeDetails;
    asztal = pkgs.callPackage ../../../../non-nix/ags/default.nix
        {inherit inputs;};
    agsColors = {
        wallpaper = details.wallpaper.center;
        theme = {
            blur = (1 - details.opacity) * 100;
            radius = details.rounding;
            shadows = details.shadow;
            palette = {
                primary = {
                    bg = "#${config.lib.stylix.colors.base0D}";
                    fg = "#${config.lib.stylix.colors.base00}";
                };
                secondary = {
                    bg = "#${config.lib.stylix.colors.base0E}";
                    fg = "#${config.lib.stylix.colors.base00}";
                };
                error = {
                    bg = "#${config.lib.stylix.colors.base06}";
                    fg = "#${config.lib.stylix.colors.base00}";
                };
                bg = "#${config.lib.stylix.colors.base00}";
                fg = "#${config.lib.stylix.colors.base05}";
                widget = "#${config.lib.stylix.colors.base02}";
                border = "#${config.lib.stylix.colors.base02}";
            };
        };
        font = {
            size = settings.themeDetails.fontSize;
            name = settings.themeDetails.font;
        };
        widget = {
            opacity = details.opacity * 100;
        };
    };
    agsOptions = lib.recursiveUpdate agsColors details.ags;
in {
    imports = [ inputs.ags.homeManagerModules.default ];
    home.packages = with pkgs; [
        asztal
        bun
        fd
        dart-sass
        gtk3
        pulsemixer
        networkmanager
        pavucontrol

        brightnessctl
        hyprlock
        sway-contrib.grimshot
    ];

    programs.ags = {
        enable = true;
        configDir = ../../../../non-nix/ags;
    };

    home.file.".cache/ags/options-nix.json".text = (builtins.toJSON agsOptions);
    home.packages = with pkgs; [
    # Spotifyd is slow with playerctl, use dbus insted.
    (pkgs.writeScriptBin "hyprmusic" ''
      #!/bin/sh
      set -euo pipefail
      case "''${1:-}" in
        next)
          MEMBER=Next
          ;;

        previous)
          MEMBER=Previous
          ;;

        play)
          MEMBER=Play
          ;;

        pause)
          MEMBER=Pause
          ;;

        play-pause)
          MEMBER=PlayPause
          ;;

        *)
          echo "Usage: $0 next|previous|play|pause|play-pause"
          exit 1
          ;;

      esac

      exec dbus-send                                                \
        --print-reply                                               \
        --dest="org.mpris.MediaPlayer2.''$(playerctl -l | head -n 1)" \
        /org/mpris/MediaPlayer2                                     \
        "org.mpris.MediaPlayer2.Player.$MEMBER"
    '')
    ];
}
