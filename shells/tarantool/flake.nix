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
          semgrep
          gdb

          cpulimit

          # tt
          lua51Packages.lua
          lua51Packages.luacheck
          lua51Packages.luacov
          lua51Packages.luacheck
          unzip
          pkg-config

          cpulimit

          # Tarantool dependencies
          curl
          libyaml

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
          python310Packages.pip #pyyaml, gevent, six
          lz4

          # TT building
          go
          mage
        ];
        shellHook = ''
            export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib
            export LUA_INCDIR=${pkgs.lua51Packages.lua}/include
            export TARANTOOL_DIR=$HOME/Programming/tnt/tarantool/install/var/empty/local/
            export TARANTOOL_INCDIR=$TARANTOOL_DIR/include
            export PATH=$TARANTOOL_DIR/bin:$PATH
            export PATH=$HOME/.rocks/bin:$PATH
            # Cluster management
            export PATH=$HOME/Programming/tnt/tarantool/test-run:$PATH
            export PATH=$HOME/Programming/tnt/tt:$PATH
            # Lint check
            export PATH=$HOME/Programming/tnt/checkpatch:$PATH
            # Use gcc for compilation
            # export CC=${pkgs.gcc}/bin/gcc
            # export CXX=${pkgs.gcc}/bin/c++
            export CC=${pkgs.clang}/bin/clang
            export CXX=${pkgs.clang}/bin/clang++
            source $HOME/Programming/tnt/.venv/bin/activate
        '';

        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
