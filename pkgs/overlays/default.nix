/*
 * This contains various packages we want to overlay. Note that the
 * other ".nix" files in this directory are automatically loaded.
 */
final: prev: {
    _nemu = final.callPackage ../nemu.nix {};
    _hydra = final.callPackage ../hydra.nix {};
    _stmp = final.callPackage ../stmp.nix {};
    _subsonic-tui = final.callPackage ../subsonic-tui.nix {};
    _neonmodem = final.callPackage ../neonmodem.nix {};
    _nyarch-assistant = final.callPackage ../nyarch-assistant.nix {};
    _msgpuck = final.callPackage ../msgpuck.nix {};
}
