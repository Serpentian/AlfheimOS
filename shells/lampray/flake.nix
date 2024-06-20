{
  description = "Nix shell for running Lampray";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          gnome.zenity
        ];
        shellHook = ''
            export PATH=$HOME/Drives/hdd/bg3_mods:$PATH
        '';
        LD_LIBRARY_PATH = "${nixpkgs.lib.makeLibraryPath [pkgs.SDL2 pkgs.lz4]}";
        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
