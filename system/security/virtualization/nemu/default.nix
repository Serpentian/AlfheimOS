{ config, pkgs, ... }:

let
  nixpkgs = import <nixpkgs> { config = config.nixpkgs.config; };
in {

  imports = [
    ./module.nix
  ];

  programs.nemu = {
    package = pkgs._nemu;
    enable = true;
    vhostNetGroup = "vhost";
    macvtapGroup = "vhost";
    usbGroup = "usb";
    users = {
      serpentian = {
        autoAddVeth = true;
        autoStartDaemon = true;
      };
    };
  };
}
