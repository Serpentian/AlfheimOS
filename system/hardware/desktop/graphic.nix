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
    hardware.amdgpu.opencl.enable = true;
    systemd.tmpfiles.rules =
        let
            rocmEnv = pkgs.symlinkJoin {
                name = "rocm-combined";
                paths = with pkgs.rocmPackages; [
                    rocblas
                    hipblas
                    clr
                ];
            };
        in [
            "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
        ];
}
