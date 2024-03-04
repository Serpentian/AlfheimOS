{ settings, ... }:
{
    imports = [
        ../work/home.nix
        ../../user/apps/mangohud.nix
        (./. + "../../../user/wm"+("/" + builtins.elemAt settings.wm 1)+".nix")
    ];
}
