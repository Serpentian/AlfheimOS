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
            # Installation.
            (pkgs.python311.withPackages (python-pkgs: [
                python-pkgs.pip
                python-pkgs.requests
                python-pkgs.virtualenv
            ]))
        ];

        LD_LIBRARY_PATH =
                "${pkgs.stdenv.cc.cc.lib}/lib/:${pkgs.libGL}/lib/:${pkgs.glib.out}/lib/:$LD_LIBRARY_PATH";

        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
