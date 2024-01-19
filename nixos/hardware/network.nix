{ config, pkgs, ... }:

{
  # Basic settings.
  networking.hostName = "alfheim";
  networking.dhcpcd.enable = true;

  networking.firewall = {
      enable = true;
      allowedTCPPortRanges = [
         { from = 1714; to = 1764; } # KDE Connect
      ];

      allowedUDPPortRanges = [
         { from = 1714; to = 1764; } # KDE Connect
      ];

      allowedUDPPorts = [ 51820 ]; # WireGuard
  };

  # Enable WireGuard
  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = [ "10.200.200.3/32" ];
      privateKeyFile = "/etc/wireguard/private.key";
      dns = [ "10.200.200.1" ];
      mtu = 1450;

      peers = [
        {
          publicKey = "0catAJY1uisr7cL8qu9t3Nwo6nlf6Go7rByyi0iWCC0=";
          presharedKeyFile = "/etc/wireguard/preshared.key";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "46.28.234.6:51820";
          persistentKeepalive = 15;
        }
      ];
    };
  };
}
