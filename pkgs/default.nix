{ pkgs }: rec {
    _codex-bin = pkgs.callPackage ./codex-bin.nix {};
    _nemu = pkgs.callPackage ./nemu.nix {};
    _hydra = pkgs.callPackage ./hydra.nix {};
    _subsonic-tui = pkgs.callPackage ./subsonic-tui.nix {};
    _neonmodem = pkgs.callPackage ./neonmodem.nix {};
    _nyarch-assistant = pkgs.callPackage ./nyarch-assistant.nix {};
    _msgpuck = pkgs.callPackage ./msgpuck.nix {};
}
