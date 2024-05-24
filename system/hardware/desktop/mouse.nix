{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        logiops
    ];

    systemd.services.logid = {
        enable = true;
        description = "An unofficial userspace driver for Logitech devices";
        serviceConfig = {
            ExecStart = "${pkgs.logiops}/bin/logid";
        };
        wantedBy = [ "multi-user.target" ];
    };

    environment.etc = {
        "logid.cfg" = {
        text = ''
devices: ({
    name: "MX Master 3S";

    smartshift: {
      on: true;
      threshold: 30;
    };

    hiresscroll: {
      hires: false;
      invert: false;
      target: false;
    };

    dpi: 4000;

    thumbwheel: {
      divert: true;
      invert: false;
      left:
      {
          direction: "Left";
          mode: "OnInterval";
          interval: 3;
          action =
          {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA", "KEY_LEFTALT", "KEY_J" ];
          };
      };
      right:
      {
          direction: "Right";
          mode: "OnInterval";
          interval: 3;
          action =
          {
              type: "Keypress";
              keys: [ "KEY_LEFTMETA", "KEY_LEFTALT", "KEY_K" ];
          };
      };
    };

    buttons: (
      // Forward button (music control)
      {
        cid: 0x56;
        action = {
          type: "Gestures";
          gestures: (
            {
              direction: "None";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: [ "KEY_FORWARD" ];
              }
            },

            {
              direction: "Up";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: [ "KEY_LEFTMETA", "KEY_LEFTALT", "KEY_P" ];
              }
            },

            {
              direction: "Right";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: [ "KEY_LEFTMETA", "KEY_LEFTALT", "KEY_L" ];
              }
            },

            {
              direction: "Left";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: [ "KEY_LEFTMETA", "KEY_LEFTALT", "KEY_H" ];
              }
            }
          );
        };
      },

      // Back button (nothing but back, misclick too ofter)
      {
        cid: 0x53;
        action = {
          type: "Gestures";
          gestures: (
            {
              direction: "None";
              mode: "OnRelease";
              action = {
                type: "Keypress";
                keys: [ "KEY_BACK" ];
              }
            }
          );
        };
      },

      // Gesture button
      {
        cid: 0xc3;
        action = {
            type: "Keypress";
            keys: [ "KEY_LEFTMETA" ];
        };
     });
});
        '';
        };
    };
}
