{pkgs, config, ...}:
{
    home.packages = with pkgs; [
        television
        nix-search-tv
    ];

    home.file.".config/television/themes/stylix.toml".text = ''
# general
# background = nil, transparent
remote_control_mode_bg = '#00000000'
border_fg = '#${config.lib.stylix.colors.base04}'
text_fg = '#${config.lib.stylix.colors.base05}'
dimmed_text_fg = '#${config.lib.stylix.colors.base0D}'
# input
input_text_fg = '#${config.lib.stylix.colors.base08}'
result_count_fg = '#${config.lib.stylix.colors.base08}'
# results
result_name_fg = '#${config.lib.stylix.colors.base0D}'
result_line_number_fg = '#${config.lib.stylix.colors.base0A}'
result_value_fg = '#${config.lib.stylix.colors.base07}'
selection_fg = '#${config.lib.stylix.colors.base0B}'
selection_bg = '#${config.lib.stylix.colors.base02}'
match_fg = '#${config.lib.stylix.colors.base08}'
# preview
preview_title_fg = '#${config.lib.stylix.colors.base09}'
# modes
channel_mode_fg = '#${config.lib.stylix.colors.base06}'
remote_control_mode_fg = '#${config.lib.stylix.colors.base0B}'
send_to_channel_mode_fg = '#${config.lib.stylix.colors.base0D}'
        '';

    home.file.".config/television/config.toml".source = ./config.toml;
    home.file.".config/television/cable/nix.toml".source = ./nix.toml;
}
