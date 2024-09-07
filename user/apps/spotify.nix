{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    spotify-player
  ];

  # enable_notify option doesn't work.
  # theme = "Catppuccin-mocha"
  home.file.".config/spotify-player/app.toml".text = ''
    enable_notify = false
    client_id = "567f94ac911c4c2c86c35aa69fb38759"
    client_port = 8888
    playback_format = """
    {track} • {artists}
    {album}
    {metadata}"""
    tracks_playback_limit = 50
    app_refresh_duration_in_ms = 32
    playback_refresh_duration_in_ms = 2000
    cover_image_refresh_duration_in_ms = 2000
    page_size_in_rows = 20
    play_icon = "▶"
    pause_icon = "▌▌"
    liked_icon = "♥"
    border_type = "Plain"
    progress_bar_type = "Rectangle"
    playback_window_position = "Top"
    cover_img_length = 9
    cover_img_width = 5
    cover_img_scale = 1.0
    playback_window_width = 6
    enable_media_control = true
    enable_streaming = "Always"
    enable_cover_image_cache = true
    default_device = "spotify-player"

    [copy_command]
    command = "xclip"
    args = [
        "-sel",
        "c",
    ]

    [device]
    name = "spotify-player"
    device_type = "speaker"
    volume = 100
    bitrate = 320
    audio_cache = true
    normalization = true
  '';

#  home.file.".config/spotify-player/theme.toml".text = ''
#    # Catppuccin themes for Spotify-player
#    [[themes]]
#    name = "Catppuccin-mocha"
#    [themes.palette]
#    # background = "#1E1E2E"
#    foreground = "#CDD6F4"
#    # black = "#1E1E2E"
#    blue = "#89B4FA"
#    cyan = "#89DCEB"
#    green = "#A6E3A1"
#    magenta = "#CBA6F7"
#    red = "#F38BA8"
#    white = "#CDD6F4"
#    yellow = "#F9E2AF"
#    # bright_black = "#1E1E2E"
#    bright_blue = "#89B4FA"
#    bright_cyan = "#89DCEB"
#    bright_green = "#A6E3A1"
#    bright_magenta = "#CBA6F7"
#    bright_red = "#F38BA8"
#    bright_white = "#CDD6F4"
#    bright_yellow = "#F9E2AF"
#
#    [themes.component_style]
#    selection = { bg = "#313244", modifiers = ["Bold"] }
#  '';
}
