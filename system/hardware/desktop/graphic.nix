{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    boot.initrd.kernelModules = [ "amdgpu" ];
    services.xserver.videoDrivers = [ "amdgpu" ];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
            rocmPackages.clr
            rocmPackages.clr.icd
            rocmPackages.rocminfo
            rocmPackages.rocm-runtime
        ];
    };

    environment.systemPackages = with pkgs; [
        rocmPackages.rocm-smi
    ];

    # This is necesery because many programs hard-code the path to hip
    systemd.tmpfiles.rules = [
        "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
}
