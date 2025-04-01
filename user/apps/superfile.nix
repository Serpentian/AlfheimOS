{ inputs, config, pkgs, ... }:

{
    home.packages = with pkgs; [
        superfile
    ];

    home.file.".config/superfile/config.toml".text = ''
# change your theme
theme = 'catppuccin'
#
# Auto check for update
auto_check_update = false
#
# Cd on quit (For more details, please check out https://superfile.netlify.app/configure/superfile-config/#cd_on_quit)
cd_on_quit = false
#
# Whether to open file preview automatically every time superfile is opened.
default_open_file_preview = true
#
# The path of the first file panel when superfile is opened. (DON'T USE '~')
default_directory = "."
#
# Display file sizes using powers of 1000 (kB, MB, GB) instead of powers of 1024 (KiB, MiB, GiB).
file_size_use_si = false
#
# ================   Style =================
#
# If you don't have or don't want Nerdfont installed you can turn this off
nerdfont = true
#
# Set transparent background or not (this only work when your terminal background is transparent)
transparent_background = true
#
# File preview width allow '0' (this mean same as file panel),'x' x must be less than 10 and greater than 1 (This means that the width of the file preview will be one xth of the total width.)
file_preview_width = 0
#
# The length of the sidebar. If you don't want to display the sidebar, you can input 0 directly. If you want to display the value, please place it in the range of 3-20.
sidebar_width = 20
#
# Border style
border_top = '─'
border_bottom = '─'
border_left = '│'
border_right = '│'
border_top_left = '╭'
border_top_right = '╮'
border_bottom_left = '╰'
border_bottom_right = '╯'
border_middle_left = '├'
border_middle_right = '┤'
#
# ==========PLUGINS========== #
#
# Show more detailed metadata, please install exiftool before enabling this plugin!
metadata = false
#
# Enable MD5 checksum generation for files
enable_md5_checksum = false
    '';
}
