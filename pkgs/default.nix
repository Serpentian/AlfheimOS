{ pkgs }: rec {
  # _logiops = pkgs.callPackage ./logiops { };
   _spotify-player = pkgs.callPackage ./spotify-player.nix {};
}
