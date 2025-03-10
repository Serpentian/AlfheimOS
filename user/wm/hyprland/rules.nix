{...}:

{
    wayland.windowManager.hyprland.settings = {
        layerrule = [
            "blur, waybar"
            "blur, swaync-control-center"
            "blur, gtk-layer-shell"
            "xray 1, gtk-layer-shell"
            "xray 1, waybar"
            "ignorezero, waybar"
            "ignorezero, gtk-layer-shell"
            "ignorealpha 0.5, swaync-control-center"
        ];

        windowrule = [
            "float,title:^(swayimg)(.*)$"
        ];

        windowrulev2 = [
            "keepaspectratio,class:^(firefox)$,title:^(Picture-in-Picture)$"
            "noborder,class:^(firefox)$,title:^(Picture-in-Picture)$"
            "pin,class:^(firefox)$,title:^(Firefox)$"
            "pin,class:^(firefox)$,title:^(Picture-in-Picture)$"
            "float,class:^(firefox)$,title:^(Firefox)$"
            "float,class:^(firefox)$,title:^(Picture-in-Picture)$"

            "float,class:^(floating)$,title:^(kitty)$"
            "size 50% 50%,class:^(floating)$,title:^(kitty)$"
            "center,class:^(floating)$,title:^(kitty)$"

            "float,class:^(moe.launcher.the-honkers-railway-launcher)$"
            "float,class:^(lutris)$"
            "size 1664 1005,class:^(lutris)$"
            "center,class:^(lutris)$"

            "fullscreen,class:^steam_app\d+$"
            "monitor 0,class:^steam_app_\d+$"
            "workspace 10,class:^steam_app_\d+$"
        ];

        workspace = [
            "special,gapsin:24,gapsout:64"
        ];
    };
}
