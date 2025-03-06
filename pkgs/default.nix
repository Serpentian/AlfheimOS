{ pkgs }: rec {
    _nemu = pkgs.callPackage ./nemu.nix {};
    _hydra = pkgs.callPackage ./hydra.nix {};
}
