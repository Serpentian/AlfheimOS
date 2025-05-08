/*
 * This contains various packages we want to overlay. Note that the
 * other ".nix" files in this directory are automatically loaded.
 */
final: prev: {
    _nemu = final.callPackage ../pkgs/nemu.nix {};
    _hydra = final.callPackage ../pkgs/hydra.nix {};
    _stmp = final.callPackage ../pkgs/stmp.nix {};
    _subsonic-tui = final.callPackage ../pkgs/subsonic-tui.nix {};
    _neonmodem = final.callPackage ../pkgs/neonmodem.nix {};
}
