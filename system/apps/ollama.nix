{ settings, pkgs, ... }:

{
    services.ollama = rec {
        enable = true;

        host = "127.0.0.1";
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
