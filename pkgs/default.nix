{ pkgs }: rec {
   _nemu = pkgs.callPackage ./nemu.nix {};
   _nwg-drawer = pkgs.callPackage ./nwg-drawer.nix {};
}
