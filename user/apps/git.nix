{ config, pkgs, ...}:

{
    programs.git = {
        enable = true;
        userName = "Nikita Zheleztsov";
        userEmail = "n.zheleztsov@proton.me";
        extraConfig.core.editor = "nvim";
        extraConfig = {
            url = {
                "git@github.com:tarantool" = {
                    insteadOf = "https://github.com/tarantool";
                };
            };
        };
    };

    programs.lazygit = {
        enable = true;
    };
}
