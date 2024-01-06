{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # 0.3.1 version from the local overlay.
    _logiops
  ];

  # Create systemd service
  systemd.services.logiops = {
    enable = true;
    description = "An unofficial userspace driver for HID++ Logitech devices";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs._logiops}/bin/logid";
    };
  };

    # Configuration for logiops
  environment.etc."logid.cfg".text = ''
    devices: ({
      name: "MX Master 3S";
      smartshift: {
        on: true;
        threshold: 12;
      };
      hiresscroll: {
        hires: true;
        target: false;
      };
      dpi: 1200;
      buttons: ({
        cid: 0xc3;
        action = {
          type: "Gestures";
          gestures: ({
            direction: "Left";
            mode: "OnRelease";
            action = {
              type = "Keypress";
              keys: ["KEY_F15"];
            };
          }, {
            direction: "Right";
            mode: "OnRelease";
            action = {
              type = "Keypress";
              keys: ["KEY_F16"];
            };
          }, {
            direction: "Down";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: ["KEY_F17"];
            };
          }, {
            direction: "Up";
            mode: "OnRelease";
            action = {
              type: "Keypress";
              keys: ["KEY_F18"];
            };
          }, {
            direction: "None";
            mode: "OnRelease";
            action = {
              type = "Keypress";
              keys: ["KEY_PLAYPAUSE"];
            };
          });
        };
      }, {
        cid: 0xc4;
        action = {
          type: "Keypress";
          keys: ["KEY_F19"];
        };
      });
    });
  '';
}
