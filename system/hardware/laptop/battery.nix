{
    # Laptop related settings for optimization.
    powerManagement.enable = true;
    services.thermald.enable = true;
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
        battery = {
            governor = "powersave";
            turbo = "never";
        };
        charger = {
            governor = "performance";
            turbo = "auto";
        };
    };
}
