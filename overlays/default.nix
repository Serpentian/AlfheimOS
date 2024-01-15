/*
 * This contains various packages we want to overlay. Note that the
 * other ".nix" files in this directory are automatically loaded.
 */
final: prev: {
  # _logiops = final.callPackage ../pkgs/logiops {};
  _spotify-player = final.callPackage ../pkgs/spotify-player.nix {};
}
