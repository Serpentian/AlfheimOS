{inputs, settings, ...}:
{
    home.sessionVariables = {
        BROWSER = "zen";
    };

    home.packages = [
        inputs.zen-browser.packages.${settings.system}.twilight
    ];
}
