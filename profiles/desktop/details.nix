{...}:
rec {
    hyprlandMonitors = [
        "DP-1, 3440x1440@144, 0x0, 1"
        "HDMI-A-1, 2560x1440@144,-2560x0, 1"
        "HDMI-A-2, 2560x1440@144,3440x0, 1"
    ];
    monitorsPosition = {
        left = "HDMI-A-1";
        center = "DP-1";
        right = "HDMI-A-2";
    };
}
