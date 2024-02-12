{ inputs, config, pkgs, ... }:

{
    imports =
        [
        ./wayland.nix
            ./fonts.nix
        ];

    programs.wayfire = {
        enable = true;
        plugins = with pkgs.wayfirePlugins; [
            wcm
            wf-shell
            wayfire-plugins-extra
        ];
    };
}
