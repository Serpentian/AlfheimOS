{ config, pkgs, ... }:

{
    hardware.graphics.enable32Bit = true;
    environment.variables = {
        AMD_VULKAN_ICD = "RADV";
    };
}
