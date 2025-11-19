{ settings, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        python313Packages.huggingface-hub
    ];

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
    };
}
