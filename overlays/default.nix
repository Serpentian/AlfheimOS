/*
 * This contains various packages we want to overlay. Note that the
 * other ".nix" files in this directory are automatically loaded.
 */
final: prev: {
  _spotify-player = final.callPackage ../pkgs/spotify-player.nix {};
  _nemu = final.callPackage ../pkgs/nemu.nix {};
  _nwg-drawer = final.callPackage ../pkgs/nwg-drawer.nix {};
}
