{...}:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur, waybar"
      "ignorezero, waybar"
    ];

    windowrule = [
      "float,title:^(swayimg)(.*)$"
    ];
  };
}
