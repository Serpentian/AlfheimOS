{pkgs, ...}:
{
    home.packages = with pkgs; [
        quickemu
    ];

    # home.file.".config/television/config.toml".source = ./config.toml;
}
