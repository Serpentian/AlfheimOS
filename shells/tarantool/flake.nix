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
          lz4

          # TT building
          go
          mage
        ];
        shellHook = ''
            export PATH=$HOME/Programming/tnt/tarantool/build/src:$HOME/Programming/tnt/tt:$PATH
            export CC=${pkgs.gcc}/bin/gcc
            export CXX=${pkgs.gcc}/bin/c++
        '';

        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
