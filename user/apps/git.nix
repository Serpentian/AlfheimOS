{ config, pkgs, ...}:

{
    programs.git = {
        enable = true;
        userName = "Nikita Zheleztsov";
        userEmail = "n.zheleztsov@proton.me";
        extraConfig.core.editor = "nvim";
    };

    programs.lazygit = {
        enable = true;
    };

    services.ssh-agent.enable = true;
}
