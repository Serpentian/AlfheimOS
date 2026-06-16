{settings, swayShellDetails, swayWorkspaces, ...}:
{
    wayland.windowManager.sway.config = {
        bars = [];
        output = settings.profileDetails.swayMonitors;
        workspaceOutputAssign = swayWorkspaces.assignments;
        startup = map (command: { inherit command; always = true; })
            swayShellDetails.launchCommands;
        window.titlebar = false;
        floating.titlebar = true;
        input = {
            "type:keyboard" = {
                xkb_layout = "us,ru";
                xkb_options = "grp:alt_shift_toggle";
            };
        };
    };
}
