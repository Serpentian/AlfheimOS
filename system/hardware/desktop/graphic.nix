{ config, pkgs, ... }:

{
    hardware.opengl = {
        # radv: an open-source Vulkan driver from freedesktop
        driSupport = true;
        driSupport32Bit = true;
    };

    environment.variables = {
        AMD_VULKAN_ICD = "RADV";
    };
}
