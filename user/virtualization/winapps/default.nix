{inputs, pkgs, ...}:
{
    home.packages = [
        inputs.winapps.packages.${pkgs.system}.winapps
        # inputs.winapps.packages.${pkgs.system}.winapps-launcher
        pkgs.freerdp
        pkgs.libvirt
    ];

    home.file.".config/winapps/winapps.conf".source = ./winapps.conf;
}
