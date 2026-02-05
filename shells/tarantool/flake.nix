{
  description = "Nix shell for Tarantool";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (import ../../pkgs/overlays/default.nix)
        ];
      };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          gdb
          cpulimit
          netcat-openbsd

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
          bc
          libyaml

          git
          gcc
          # clang
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
          unzip

          # Cartridge
          nodejs

          # Tcpdump
          libnl
          libpcap
          _msgpuck
        ];
        shellHook = ''
            export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib
            export MSGPUCK_INCLUDE_DIR=${pkgs._msgpuck}/include
            export MSGPUCK_LIBRARY=${pkgs._msgpuck}/lib/libmsgpuck.a
            export LUA_INCDIR=${pkgs.lua51Packages.lua}/include
            export TARANTOOL_DIR=$HOME/Programming/tnt/tarantool/install/var/empty/local
            export TARANTOOL_INCDIR=$TARANTOOL_DIR/include
            export TT_CLI_TARANTOOL_PREFIX=$TARANTOOL_DIR
            export PATH=$TARANTOOL_DIR/bin:$PATH
            # Cluster management
            export PATH=$HOME/Programming/tnt/tarantool/test-run:$PATH
            export PATH=$HOME/Programming/tnt/tt:$PATH
            export PATH=$HOME/Programming/tnt/tt-ee:$PATH
            # Lint check
            export PATH=$HOME/Programming/tnt/checkpatch:$PATH
            export PATH=$HOME/Programming/tnt/cartridge-cli:$PATH
            # Use gcc for compilation
            export CC=${pkgs.gcc}/bin/gcc
            export CXX=${pkgs.gcc}/bin/c++
            # export CC=${pkgs.clang}/bin/clang
            # export CXX=${pkgs.clang}/bin/clang++
            source $HOME/Programming/tnt/.venv/bin/activate
            # Activate ssh.
            eval `ssh-agent -s`
            # ssh-add ~/.ssh/work
        '';

        # See https://github.com/NixOS/nixpkgs/issues/18995
        hardeningDisable = [ "fortify" ];
      };
    });
}
