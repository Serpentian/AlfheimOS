{pkgs, ...}: let
    profileName = "Default";
in {
    stylix.targets.librewolf.profileNames = [ profileName ];
    stylix.targets.librewolf.colorTheme.enable = true;
    programs.librewolf = {
        enable = true;
        settings = {
            "privacy.clearOnShutdown.history" = false;
            "privacy.clearOnShutdown.sessions" = false;
            "privacy.clearOnShutdown.downloads" = false;
            "privacy.clearOnShutdown.cookies" = false;

            "privacy.clearOnShutdown.formdata" = true;
            "privacy.clearOnShutdown.cache" = true;
        };
    };

    programs.librewolf.profiles.${profileName} = {
        extensions = {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
                nextcloud-passwords
                ublock-origin
                vimium
                stylus
            ];
        };
        search = {
            force = true;
            default = "local";
            privateDefault = "local";
            engines = {
                local = {
                    name = "SearXNG";
                    urls = [{template =
                        "https://searxng.serpentian.space/search?q={searchTerms}";
                    }];
                };
            };
        };
    };
}
