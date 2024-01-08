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
          gdb

          # Tarantool dependencies
          git
          gcc
          c-ares
          gnumake
          cmake
          nghttp2
          autoconf
          automake
          libtool
          readline
          ncurses
          openssl
          icu
          zlib
          python310
          python310Packages.pyyaml
          python310Packages.gevent
          python310Packages.six

          # TT building
          go
          mage
        ];
        shellHook = ''
            export PATH=/home/serpentian/Programming/tnt/tarantool/build/src:/home/serpentian/Programming/tnt/tt:$PATH
        '';
      };
    });
}
