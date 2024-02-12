{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    input-remapper
  ];

  # Enable systemd service.
  services.input-remapper.enable = true;
}
