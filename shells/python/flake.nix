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
        packages = [
            (pkgs.python311.withPackages (python-pkgs: [
                python-pkgs.pip
                python-pkgs.numpy
                python-pkgs.sympy
                python-pkgs.scipy
                python-pkgs.pandas
                python-pkgs.matplotlib
                python-pkgs.virtualenv
                python-pkgs.jupyterlab
            ]))
        ];

        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
