{...}:

{
    wayland.windowManager.hyprland.settings = {
        windowrule = [
            # "match:title ^(swayimg)(.*)$, float true"
            "float, title:^(swayimg)(.*)$"
        ];

        workspace = [
            "special,gapsin:24,gapsout:64"
        ];
    };
}
