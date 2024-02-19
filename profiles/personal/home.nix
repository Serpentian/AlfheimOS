{ ... }:
{
    imports = [
        ../work/home.nix
        # (./. + "../../../user/wm" + ("/" + settings.wm) + ".nix")
    ];
}
