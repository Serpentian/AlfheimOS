{ config, pkgs, ... }:

{
    environment.variables = {
        AMD_VULKAN_ICD = "RADV";
    };

    environment.systemPackages = with pkgs; [
        rocmPackages.rocm-smi
    ];

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
    # This is necesery because many programs hard-code the path to hip
    systemd.tmpfiles.rules = [
        "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
}
