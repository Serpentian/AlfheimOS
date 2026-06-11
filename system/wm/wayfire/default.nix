{ inputs, config, pkgs, ... }:

{
    programs.wayfire = {
        enable = true;
        plugins = with pkgs.wayfirePlugins; [
            wcm
            wf-shell
            wayfire-plugins-extra
        ];
    };
}
