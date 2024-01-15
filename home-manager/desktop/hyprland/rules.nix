{...}:

{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur, waybar"
      "blur, swaync-control-center"
      "ignorezero, waybar"
      "ignorealpha 0.5, swaync-control-center"
    ];

    windowrule = [
      "float,title:^(swayimg)(.*)$"
    ];
  };
}
