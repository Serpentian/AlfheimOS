{lib, pkgs, swayShellDetails, swayWorkspaces, ... }: let
    mod = "Mod4";
    binds = swayShellDetails.binds;
    exec = command: "exec ${command}";
    enterMode = label: mode:
        "exec ${pkgs.runtimeShell} -c 'printf %s ${label} > /tmp/submap'; "
        + "mode ${mode}";
    leaveMode =
        "exec ${pkgs.coreutils}/bin/truncate -s 0 /tmp/submap; "
        + "mode default";

    # Generate output-local Mod+1..0 and Mod+Shift+1..0.
    workspaceBindings = builtins.listToAttrs (
        lib.concatMap
        (workspace:
            let
                number = toString workspace;
                key = if workspace == 10 then "0" else number;
            in [
                {
                    name = "${mod}+${key}";
                    value =
                        exec "${swayWorkspaces.command} focus ${number}";
                }
                {
                    name = "${mod}+Shift+${key}";
                    value =
                        exec "${swayWorkspaces.command} move ${number}";
                }
            ]
        )
        (lib.range 1 10)
    );

    keybindings = {
        # Window/session actions.
        "${mod}+q" = "kill";
        "${mod}+w" = "fullscreen toggle";
        "${mod}+Shift+w" = "fullscreen toggle global";
        "${mod}+e" = "floating toggle";
        "${mod}+Delete" = "exit";

        # Layout management.
        "${mod}+o" = "split toggle";
        # Switch between tiled and floating windows.
        "${mod}+Control+space" = "focus mode_toggle";
        # Select container layouts.
        "${mod}+t" = "layout toggle";

        # Session management.
        "${mod}+Escape" = exec binds.lock;
        "${mod}+Shift+r" = "reload";

        # Application shortcuts.
        "${mod}+Return" =
            "exec ${pkgs.kitty}/bin/kitty";

        # Launcher and screenshot.
        "${mod}+Shift+a" = exec binds.launcher;
        "${mod}+Shift+z" = exec binds.screenshot;

        # Enter binding modes.
        "${mod}+r" = enterMode "Resize" "resize";

        # Navigate nested containers.
        "${mod}+Control+k" = "focus parent";
        "${mod}+Control+Up" = "focus parent";
        "${mod}+Control+j" = "focus child";
        "${mod}+Control+Down" = "focus child";

        # Focus with Vim keys and arrow keys.
        "${mod}+h" = "focus left";
        "${mod}+Left" = "focus left";

        "${mod}+j" = "focus down";
        "${mod}+Down" = "focus down";

        "${mod}+k" = "focus up";
        "${mod}+Up" = "focus up";

        "${mod}+l" = "focus right";
        "${mod}+Right" = "focus right";

        # Move windows with Vim keys and arrow keys.
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+Left" = "move left";

        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+Down" = "move down";

        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+Up" = "move up";

        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Right" = "move right";

        # Center a floating window.
        "${mod}+Shift+c" = "move position center";
        # Keep a floating window visible on every workspace.
        "${mod}+Control+s" = "sticky toggle";

        # Show/hide the next scratchpad window.
        "${mod}+s" = "scratchpad show";
        # Hide the focused container in the scratchpad.
        "${mod}+Shift+s" = "move container to scratchpad";

        # Move focus to the output on the right.
        "${mod}+Tab" = "focus output right";

        # Previous/next local workspace on the focused output.
        "${mod}+Control+h" = exec "${swayWorkspaces.command} prev";
        "${mod}+Control+Left" = exec "${swayWorkspaces.command} prev";
        "${mod}+Control+l" = exec "${swayWorkspaces.command} next";
        "${mod}+Control+Right" = exec "${swayWorkspaces.command} next";

        # Move the focused window and follow it.
        "${mod}+Control+Shift+h" = exec "${swayWorkspaces.command} move-prev";
        "${mod}+Control+Shift+Left" = exec "${swayWorkspaces.command} move-prev";
        "${mod}+Control+Shift+l" = exec "${swayWorkspaces.command} move-next";
        "${mod}+Control+Shift+Right" = exec "${swayWorkspaces.command} move-next";

        # Media and brightness keys.
        "--locked XF86AudioRaiseVolume" = exec binds.volumeUp;
        "--locked XF86AudioLowerVolume" = exec binds.volumeDown;
        "--locked XF86MonBrightnessUp" = exec binds.brightnessUp;
        "--locked XF86MonBrightnessDown" = exec binds.brightnessDown;
        "--locked XF86AudioMicMute" = exec binds.micMute;
        "--locked XF86AudioNext" = exec binds.mediaNext;
        "--locked XF86AudioPrev" = exec binds.mediaPrev;
        "--locked XF86AudioPlay" = exec binds.mediaToggle;

        # Mouse wheel workspace navigation.
        "--whole-window ${mod}+button4" = exec "${swayWorkspaces.command} next";
        "--whole-window ${mod}+button5" = exec "${swayWorkspaces.command} prev";
        # Middle-click while holding Mod kills the focused window.
        "--whole-window ${mod}+button2" = "kill";
    } // workspaceBindings;
in
    {
    wayland.windowManager.sway = {
        enable = true;

        config = {
            modifier = mod;
            bindkeysToCode = true;

            # Mod + left-click moves floating windows.
            # Mod + right-click resizes floating windows.
            floating = {
                modifier = mod;
            };

            keybindings = lib.mkOptionDefault keybindings;

            modes = {
                resize = {
                    "h" = "resize shrink width 30 px";
                    "Left" = "resize shrink width 30 px";

                    "j" = "resize grow height 30 px";
                    "Down" = "resize grow height 30 px";

                    "k" = "resize shrink height 30 px";
                    "Up" = "resize shrink height 30 px";

                    "l" = "resize grow width 30 px";
                    "Right" = "resize grow width 30 px";

                    "Escape" = leaveMode;
                    "Return" = leaveMode;
                };
            };
        };
    };
}
