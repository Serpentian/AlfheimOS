{pkgs, stylix, config, ...}: let
    install = url: {
        install_url = url;
        installation_mode = "force_installed";
    };
    profileName = "Zen";
in {
    stylix.targets.zen-browser.profileNames = [ profileName ];

    programs.zen-browser.enable = true;
    programs.zen-browser.suppressXdgMigrationWarning = true;
    programs.zen-browser.policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
        };
    };
    programs.zen-browser.profiles.${profileName} = {
        isDefault = true;
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
        settings = {
            "zen.view.use-single-toolbar" = false;
            "zen.view.grey-out-inactive-windows" = false;
            "zen.tabs.vertical.right-side" = true;
            "zen.urlbar.replace-newtab" = false;
            "media.hardwaremediakeys.enabled" = false;
            "browser.tabs.allow_transparent_browser" = true;
        };
    };
}
