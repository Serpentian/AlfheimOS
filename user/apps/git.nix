{ config, pkgs, ...}:

{
    programs.git = {
        enable = true;
        settings = {
            url = {
                "git@github.com:tarantool" = {
                    insteadOf = "https://github.com/tarantool";
                };
            };
            core.editor = "nvim";
            user = {
                name = "Nikita Zheleztsov";
                email = "n.zheleztsov@proton.me";
            };
            stash = {
                showPatch = true;
            };
        };
    };

    programs.lazygit = {
        enable = true;
    };
}
