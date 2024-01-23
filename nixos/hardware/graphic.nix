{ config, pkgs, ... }:

{
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
        rocmPackages.clr.icd
        pkgs.amdvlk
    ];
    extraPackages32 = [
        pkgs.driversi686Linux.amdvlk
    ];
  };

  services.xserver.videoDrivers = ["amdgpu"];
}
