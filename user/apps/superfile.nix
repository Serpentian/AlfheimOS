{ config, pkgs, inputs, ... }:

{
    home.packages = with pkgs; [
        exiftool
        inputs.superfile.packages.${system}.default
    ];

    #home.file.".config/superfile/config/config.json".text = ''
#set preview_images true
#'';
}
