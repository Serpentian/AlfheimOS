{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here

        # Honkai
        # libadwaita
        # gnome2.pango
        # (mangohud.override { lowerBitnessSupport = true; })
        # gamemode # LD_PRELOAD error otherwise
        # gtk4
      ];
      extraPkgs = pkgs: [
        # wine
      ];
    })
    wine64
    wine
    gamescope
    _hydra
  ];

  networking.hosts = {
#    "0.0.0.0" = [
#      "overseauspider.yuanshen.com"
#      "log-upload-os.hoyoverse.com"
#      "log-upload-os.mihoyo.com"
#      "dump.gamesafe.qq.com"
#
#      "log-upload.mihoyo.com"
#      "devlog-upload.mihoyo.com"
#      "uspider.yuanshen.com"
#      "sg-public-data-api.hoyoverse.com"
#      "public-data-api.mihoyo.com"
#
#      "prd-lender.cdp.internal.unity3d.com"
#      "thind-prd-knob.data.ie.unity3d.com"
#      "thind-gke-usc.prd.data.corp.unity3d.com"
#      "cdp.cloud.unity3d.com"
#      "remote-config-proxy-prd.uca.cloud.unity3d.com"
#    ];
  };
}
