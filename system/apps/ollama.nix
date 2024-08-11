{ settings, pkgs, ... }:

{
    services.ollama = rec {
        enable = true;

        openFirewall = true;
        host = "0.0.0.0";
        port = 11434;

        acceleration = "rocm";
        rocmOverrideGfx = "11.0.1";
        environmentVariables = {
            HCC_AMDGPU_TARGET = "gfx1101";
        };

        user = "ollama";
        home = "/mnt/hdd/ollama";
        models = "/mnt/hdd/ollama/models";
    };
}
