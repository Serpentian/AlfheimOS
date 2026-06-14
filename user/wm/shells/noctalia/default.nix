{config, settings, ...}: let
    themeDetails = settings.themeDetails;
    profileDetails = settings.profileDetails;
    palette = {
        dark = {
            mPrimary = "#${config.lib.stylix.colors.base0D}";
            mOnPrimary = "#${config.lib.stylix.colors.base00}";
            mSecondary = "#${config.lib.stylix.colors.base0A}";
            mOnSecondary = "#${config.lib.stylix.colors.base00}";
            mTertiary = "#${config.lib.stylix.colors.base0C}";
            mOnTertiary = "#${config.lib.stylix.colors.base00}";
            mError = "#${config.lib.stylix.colors.base08}";
            mOnError = "#${config.lib.stylix.colors.base00}";
            mSurface = "#${config.lib.stylix.colors.base00}";
            mOnSurface = "#${config.lib.stylix.colors.base05}";
            mSurfaceVariant = "#${config.lib.stylix.colors.base01}";
            mOnSurfaceVariant = "#${config.lib.stylix.colors.base05}";
            mOutline = "#${config.lib.stylix.colors.base04}";
            mShadow = "#${config.lib.stylix.colors.base00}";
            mHover = "#${config.lib.stylix.colors.base02}";
            mOnHover = "#${config.lib.stylix.colors.base05}";

            terminal = {
                background = "#${config.lib.stylix.colors.base00}";
                foreground = "#${config.lib.stylix.colors.base05}";

                cursor = "#${config.lib.stylix.colors.base05}";
                cursorText = "#${config.lib.stylix.colors.base00}";

                selectionBg = "#${config.lib.stylix.colors.base02}";
                selectionFg = "#${config.lib.stylix.colors.base05}";

                normal = {
                    black = "#${config.lib.stylix.colors.base00}";
                    red = "#${config.lib.stylix.colors.base08}";
                    green = "#${config.lib.stylix.colors.base0B}";
                    yellow = "#${config.lib.stylix.colors.base0A}";
                    blue = "#${config.lib.stylix.colors.base0D}";
                    magenta = "#${config.lib.stylix.colors.base0E}";
                    cyan = "#${config.lib.stylix.colors.base0C}";
                    white = "#${config.lib.stylix.colors.base05}";
                };

                bright = {
                    black = "#${config.lib.stylix.colors.base03}";
                    red = "#${config.lib.stylix.colors.base08}";
                    green = "#${config.lib.stylix.colors.base0B}";
                    yellow = "#${config.lib.stylix.colors.base0A}";
                    blue = "#${config.lib.stylix.colors.base0D}";
                    magenta = "#${config.lib.stylix.colors.base0E}";
                    cyan = "#${config.lib.stylix.colors.base0C}";
                    white = "#${config.lib.stylix.colors.base07}";
                };
            };
        };
    };
in {
    programs.noctalia = {
        enable = true;
        settings = {
            # configure options
            theme = {
                source = "custom";
                custom_palette = "stylix";
            };
            shell = {
                ui_scale = 1.4;
                font_family = themeDetails.font;
                avatar_path = themeDetails.avatar;
                screenshot = {
                    directory = "~/Media/Pictures/Screenshots";
                };
                panel = {
                    clipboard_placement = "attached";
                    open_near_click_clipboard = true;
                    open_near_click_control_center = true;
                };
            };
            widget = {
                launcher = {
                    glyph = "skull";
                    scale = 1.25;
                };
                keyboard_layout = {
                    show_icon = false;
                };
                volume = {
                    show_label = false;
                    scroll_step = 2;
                };
                spacer_default = {
                    type = "spacer";
                    lenght = 15;
                };
                workspaces = {
                    minimal = true;
                    occupied_color = "on_surface";
                    scale = 1.2;
                };
                audio_visualizer = {
                    width = 120;
                };
            };
            location = {
                auto_locate = false;
                address = "Moscow, RU";
            };
            osd = {
                orientation = "vertical";
                position = "center_right";
            };
            bar.default = {
                scale = 1.4;
                thickness = 40;
                margin_edge = 0;
                margin_ends = 0;
                start = [
                    "launcher"
                    "spacer_default"
                    "weather"
                ];
                center = [
                    "audio_visualizer"
                    "workspaces"
                    "audio_visualizer"
                ];
                end = [
                    "tray"
                    "keyboard_layout"
                    "notifications"
                    "clipboard"
                    "volume"
                    "battery"
                    "spacer_default"
                    "clock"
                ];
            };
            wallpaper = {
                enable = true;
                directory = "${settings.dotfilesDir}/non-nix/wallpapers";
                monitors = {
                    "${profileDetails.monitorsPosition.left}" = {
                        path = themeDetails.wallpaper.left;
                    };
                    "${settings.profileDetails.monitorsPosition.center}" = {
                        path = themeDetails.wallpaper.center;
                    };
                    "${settings.profileDetails.monitorsPosition.right}" = {
                        path = themeDetails.wallpaper.right;
                    };
                };
            };
        };
    };

    home.file.".config/noctalia/palettes/stylix.json".text =
        (builtins.toJSON palette);
}
