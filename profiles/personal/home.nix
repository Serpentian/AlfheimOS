{ settings, ... }:
{
    imports = [
        ../work/home.nix
        (./. + "../../../user/wm"+("/" + builtins.elemAt settings.wm 1)+".nix")
    ];
}
