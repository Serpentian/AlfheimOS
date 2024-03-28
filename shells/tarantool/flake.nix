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
          clang
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
            export TARANTOOL_DIR=$HOME/Programming/tnt/tarantool/install/var/empty/local
            export PATH=$TARANTOOL_DIR/bin:$PATH
            # Cluster management
            export PATH=$HOME/Programming/tnt/tarantool/test-run:$PATH
            export PATH=$HOME/Programming/tnt/tt:$PATH
            # Lint check
            export PATH=$HOME/Programming/tnt/checkpatch:$PATH
            # Use gcc for compilation
            export CC=${pkgs.gcc}/bin/gcc
            export CXX=${pkgs.gcc}/bin/c++
        '';

        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
