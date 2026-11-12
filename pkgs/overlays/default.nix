/*
 * This contains various packages we want to overlay. Note that the
 * other ".nix" files in this directory are automatically loaded.
 */
final: prev: {
    # Backport json-c/json-c#936 for Sway until nixpkgs#586077 reaches unstable.
    # This overlay is shared by NixOS and Home Manager.
    sway-unwrapped = if prev.json_c.version == "0.19" then
        prev.sway-unwrapped.override {
            json_c = prev.json_c.overrideAttrs (old: {
                patches = prev.lib.unique ((old.patches or []) ++ [
                    (prev.fetchpatch {
                        url = "https://github.com/json-c/json-c/commit/f291fa81c6f21d925ea771a8cca597f5886309cc.patch";
                        hash = "sha256-ZffSw1pfEfOH2ylRpJShdx7sTQR2nmPM/JIj/26UrDM=";
                    })
                ]);
            });
        }
    else prev.sway-unwrapped;

    _codex-bin = final.callPackage ../codex-bin.nix {};
    _nemu = final.callPackage ../nemu.nix {};
    _hydra = final.callPackage ../hydra.nix {};
    _stmp = final.callPackage ../stmp.nix {};
    _subsonic-tui = final.callPackage ../subsonic-tui.nix {};
    _neonmodem = final.callPackage ../neonmodem.nix {};
    _nyarch-assistant = final.callPackage ../nyarch-assistant.nix {};
    _msgpuck = final.callPackage ../msgpuck.nix {};
}
