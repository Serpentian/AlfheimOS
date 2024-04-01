{
  description = "Nix shell for Tarantool";

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
            python311
            python311Packages.pip
            python311Packages.virtualenv
            python311Packages.jupyterlab
        ];

        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
