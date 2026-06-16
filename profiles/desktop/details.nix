{...}:
rec {
    hyprlandMonitors = [
        "DP-1, 3440x1440@144, 0x0, 1"
        "HDMI-A-1, 2560x1440@144,-2560x0, 1"
        "HDMI-A-2, 2560x1440@144,3440x0, 1"
    ];
    swayMonitors = {
        DP-1 = {
            mode = "3440x1440@144Hz";
            position = "0 0";
            scale = "1";
        };
        HDMI-A-1 = {
            mode = "2560x1440@144Hz";
            position = "-2560 0";
            scale = "1";
        };
        HDMI-A-2 = {
            mode = "2560x1440@144Hz";
            position = "3440 0";
            scale = "1";
        };
    };
    monitorsPosition = {
        left = "HDMI-A-1";
        center = "DP-1";
        right = "HDMI-A-2";
    };
}
