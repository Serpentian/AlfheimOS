{ pkgs }: rec {
   _spotify-player = pkgs.callPackage ./spotify-player.nix {};
   _nemu = pkgs.callPackage ./nemu.nix {};
   _nwg-drawer = pkgs.callPackage ./nwg-drawer.nix {};
}
