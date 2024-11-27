{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    # Mouse bindings.
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    binde = [
        ", XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5"
        ", XF86AudioLowerVolume, exec, pulsemixer --change-volume -5"
        ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        "$mod ALT, k, exec, pulsemixer --change-volume +5"
        "$mod ALT, j, exec, pulsemixer --change-volume -5"
    ];

    bind = [
      # Window/Session actions.
      "$mod, Q, killactive,"
      "$mod, W, fullscreen, 1"
      "$mode SHIFT, W, fullscreen,"
      "$mod, E, togglefloating,"
      "$mod, delete, exit,"

      # Dwindle
      "$mod, O, togglesplit,"
      "$mod, P, pseudo,"

      # Lock screen
      "$mod, Escape, exec, hyprlock"

      # Application shortcuts.
      "$mod, Return, exec, kitty"
      "$mod SHIFT, Return, exec, kitty --class floating"

      # Special workspace
      "$mod, S, togglespecialworkspace"
      "$mod SHIFT, S, movetoworkspacesilent, special"

      # Launcher
      # "$mod, A, exec, rofi -show drun -kb-cancel Super_L"
      "$mod SHIFT, A, exec, ags -t launcher"

      # Screenshot
      "$mod SHIFT, z, exec, wl-copy < $(grimshot --notify save area $XDG_PICTURES_DIR/Screenshots/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png'))"

      # Move window focus with vim keys.
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      # Music control
      "$mod ALT, m, exec, pulsemixer --id $(pulsemixer --list-sources | cut -f3 | grep 'Default' | cut -d ',' -f 1 | cut -c 6-) --toggle-mute"
      ", XF86AudioMicMute, exec, pulsemixer --id $(pulsemixer --list-sources | cut -f3 | grep 'Default' | cut -d ',' -f 1 | cut -c 6-) --toggle-mute"
      ",XF86AudioMute, exec, pulsemixer --id $(pulsemixer --list-sinks | cut -f3 | grep 'Default' | cut -d ',' -f 1 | cut -c 6-) --toggle-mute"
      "$mod ALT, l, exec, hyprmusic next"
      "$mod ALT, h, exec, hyprmusic previous"
      "$mod ALT, p, exec, hyprmusic play-pause"

      # Swap windows with vim keys
      "$mod SHIFT, h, swapwindow, l"
      "$mod SHIFT, l, swapwindow, r"
      "$mod SHIFT, k, swapwindow, u"
      "$mod SHIFT, j, swapwindow, d"

      "$mod SHIFT, c, centerwindow, 1"

      # Move monitor focus.
      "$mod, TAB, focusmonitor, +1"

      # Switch workspaces.
      "$mod, 1,exec,hyprworkspace 1"
      "$mod, 2,exec,hyprworkspace 2"
      "$mod, 3,exec,hyprworkspace 3"
      "$mod, 4,exec,hyprworkspace 4"
      "$mod, 5,exec,hyprworkspace 5"
      "$mod, 6,exec,hyprworkspace 6"
      "$mod, 7,exec,hyprworkspace 7"
      "$mod, 8,exec,hyprworkspace 8"
      "$mod, 9,exec,hyprworkspace 9"
      "$mod, 0,exec,hyprworkspace 10"

      "$mod CTRL, h, workspace, r-1"
      "$mod CTRL, l, workspace, r+1"

      # Scroll through monitor workspaces with mod + scroll
      "$mod, mouse_down, workspace, r-1"
      "$mod, mouse_up, workspace, r+1"
      "$mod, mouse:274, killactive,"

      # Move active window to a workspace.
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod CTRL SHIFT, l, movetoworkspace, r+1"
      "$mod CTRL SHIFT, h, movetoworkspace, r-1"
    ];
  };
  wayland.windowManager.hyprland.extraConfig = ''
    # will switch to a submap called resize
    bind=$mod,R,exec,echo -n "Resize" > /tmp/hypr_submap
    bind=$mod,R,submap,resize

    # will start a submap called "resize"
    submap=resize

    # sets repeatable binds for resizing the active window
    binde=,l,resizeactive,30 0
    binde=,h,resizeactive,-30 0
    binde=,k,resizeactive,0 -30
    binde=,j,resizeactive,0 30

    # use reset to go back to the global submap
    bind=,escape,exec,truncate -s 0 /tmp/hypr_submap
    bind=,escape,submap,reset

    # will reset the submap, meaning end the current one and return to the global one
    submap=reset

    bind=$mod,A,exec,echo -n "Launch" > /tmp/hypr_submap
    bind=$mod,A,submap,launch

    submap=launch
    bind=,F,exec,firefox
    bind=,D,exec,neovide --no-vsync

    bind=,escape,exec,truncate -s 0 /tmp/hypr_submap
    bind=,escape,submap,reset

    # Note, that after launching app submap immediately exits.
    bind=,F,exec,truncate -s 0 /tmp/hypr_submap
    bind=,F,submap,reset
    bind=,D,exec,truncate -s 0 /tmp/hypr_submap
    bind=,D,submap,reset

    # will reset the submap, meaning end the current one and return to the global one
    submap=reset
  '';
}
