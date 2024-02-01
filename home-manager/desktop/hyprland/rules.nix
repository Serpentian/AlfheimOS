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

        windowrulev2 = [
            "stayfocused, title:^()$,class:^(steam)$"
            "minsize 1 1, title:^()$,class:^(steam)$"
        ];

        windowrule = [
            "float,title:^(swayimg)(.*)$"
        ];

        workspace = [
            "special,gapsin:24,gapsout:64"
        ];
    };
}
