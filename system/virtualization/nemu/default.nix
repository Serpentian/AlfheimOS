{ config, pkgs, settings, ... }:

let
  nixpkgs = import <nixpkgs> { config = config.nixpkgs.config; };
in {

    environment.systemPackages = with pkgs; [
        virt-viewer
        tigervnc
        qemu
    ];

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
            ${settings.username} = {
                autoAddVeth = true;
                autoStartDaemon = true;
                autoStartVMs = [ "Win11" ];
            };
        };
    };
}
