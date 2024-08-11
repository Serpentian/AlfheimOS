{ settings, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ollama-rocm
    ];

    services.ollama = {
        enable = true;

        host = "127.0.0.1";
        port = 11434;

        acceleration = "rocm";
        package = (pkgs.ollama.override{ acceleration = "rocm"; });
        rocmOverrideGfx = "11.0.1";
        environmentVariables = {
            HCC_AMDGPU_TARGET = "gfx1101";
        };

        sandbox = false;
        home = "/home/${settings.username}/Drives/hdd/ollama";
        models = "/home/${settings.username}/Drives/hdd/ollama/models";
    };
}
