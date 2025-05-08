{ pkgs }: rec {
    _nemu = pkgs.callPackage ./nemu.nix {};
    _hydra = pkgs.callPackage ./hydra.nix {};
    _subsonic-tui = pkgs.callPackage ./subsonic-tui.nix {};
    _neonmodem= pkgs.callPackage ./neonmodem.nix {};
}
