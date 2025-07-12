{pkgs, ...}: {
    services.ssh-agent.enable = true;
    home.packages = with pkgs; [ sshfs ];
}
