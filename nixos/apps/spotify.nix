{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    spotifyd
  ];
 
  environment.etc."spotifyd.conf".text = ''
     [global]
 
     username = "31oq5ubh3ntv55jfcjquzuymzofu"
     password_cmd = "cat /etc/spotify/password.key"
 
     use_mpris = false
     bitrate = 320
 
     cache_path = "/home/serpentian/.cache/spotifyd"
     max_cache_size = 1000000000 # 1Gb
 
     volume_normalisation = true
     normalisation_pregain = -10
 
     autoplay = true
     backend = "pulseaudio"
  '';
 
  # Spotifyd systemd service fails to start with "Unable to autolaunch a
  # dbus-daemon without a $DISPLAY for X11" error.
}

