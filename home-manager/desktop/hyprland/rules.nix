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
            "fakefullscreen,class:^(firefox)$,title:^(Firefox)$"
            "fakefullscreen,class:^(firefox)$,title:^(Picture-in-Picture)$"
            "pin,class:^(firefox)$,title:^(Firefox)$"
            "pin,class:^(firefox)$,title:^(Picture-in-Picture)$"
            "float,class:^(firefox)$,title:^(Firefox)$"
            "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
        ];

        workspace = [
            "special,gapsin:24,gapsout:64"
        ];
    };
}
