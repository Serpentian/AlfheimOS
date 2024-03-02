{ inputs, config, pkgs, ... }:
{
    home.file.".config/autostart/input-remapper.desktop".text = ''
[Desktop Entry]
Name=InputRemapperAutoload
Type=Application
Exec=input-remapper-control --command autoload
Terminal=true
    '';
}

