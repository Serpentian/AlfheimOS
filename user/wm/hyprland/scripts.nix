{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (pkgs.writeScriptBin "hyprworkspace" ''
      #!/bin/sh
      # from https://github.com/taylor85345/hyprland-dotfiles/blob/master/hypr/scripts/workspace
      monitors=/tmp/hypr/monitors_temp
      hyprctl monitors > $monitors

      if [[ -z $1 ]]; then
        workspace=$(grep -B 5 "focused: no" "$monitors" | awk 'NR==1 {print $3}')
      else
        workspace=$1
      fi

      activemonitor=$(grep -B 11 "focused: yes" "$monitors" | awk 'NR==1 {print $2}')
      passivemonitor=$(grep  -B 6 "($workspace)" "$monitors" | awk 'NR==1 {print $2}')
      #activews=$(grep -A 2 "$activemonitor" "$monitors" | awk 'NR==3 {print $1}' RS='(' FS=')')
      passivews=$(grep -A 6 "Monitor $passivemonitor" "$monitors" | awk 'NR==4 {print $1}' RS='(' FS=')')

      if [[ $workspace -eq $passivews ]] && [[ $activemonitor != "$passivemonitor" ]]; then
       hyprctl dispatch workspace "$workspace" && hyprctl dispatch swapactiveworkspaces "$activemonitor" "$passivemonitor" && hyprctl dispatch workspace "$workspace"
        echo $activemonitor $passivemonitor
      else
        hyprctl dispatch moveworkspacetomonitor "$workspace $activemonitor" && hyprctl dispatch workspace "$workspace"
      fi

      exit 0
    '')
    # Spotifyd is slow with playerctl, use dbus insted.
    (pkgs.writeScriptBin "hyprmusic" ''
      #!/bin/sh
      set -euo pipefail
      case "''${1:-}" in
        next)
          MEMBER=Next
          ;;

        previous)
          MEMBER=Previous
          ;;

        play)
          MEMBER=Play
          ;;

        pause)
          MEMBER=Pause
          ;;

        play-pause)
          MEMBER=PlayPause
          ;;

        *)
          echo "Usage: $0 next|previous|play|pause|play-pause"
          exit 1
          ;;

      esac

      exec dbus-send                                                \
        --print-reply                                               \
        --dest="org.mpris.MediaPlayer2.spotify_player" \
        /org/mpris/MediaPlayer2                                     \
        "org.mpris.MediaPlayer2.Player.$MEMBER"
    '')
    (pkgs.writeScriptBin "hyprtheme" ''
      #!/bin/sh
      home-manager switch --flake .
      pkill ags
      ags 1>/dev/null 2>&1 &
      disown ags
      hyprctl reload
      pkill -USR2 cava
    '')
  ];
}
