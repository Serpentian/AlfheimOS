{ settings, config, pkgs, ... }:

{
    imports = [
        ./lib/bat.nix
        ./lib/starship.nix
        ./lib/television
        ./lib/tmux
    ];

    programs.tmux.shell = "${pkgs.zsh}/bin/zsh";
    programs.starship.enableZshIntegration = true;

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            ls = "exa --color=auto --icons";
            l = "ls -l";
            la = "ls -a";
            lla = "ls -la";
            lt = "ls --tree";
            ".." = "cd ..";
            "..." = "cd ../..";
            "...." = "cd ../../../..";
            "....." = "cd ../../../../..";
            "......" = "cd ../../../../../..";
            cat = "bat";
            gs = "git status";
            gd = "tv git-diff";
            gl = "tv git-log";
            ga = "git add";
            gc = "git commit";
            gca = "git commit -a";
            vim = "nvim";
            v = "vim";
            mv = "mv -v";
            cp = "rsync -avhW --no-compress --progress";
            rm = "rm -rv";
            w3md = "w3m https://lite.duckduckgo.com/lite/";
            nix-tarantool = "nix develop ${settings.dotfilesDir}/shells/tarantool -c zsh";
            nix-python = "nix develop ${settings.dotfilesDir}/shells/python -c zsh";
            nix-lampray = "nix develop ${settings.dotfilesDir}/shells/lampray -c zsh";
            nix-invoke = "nix develop ${settings.dotfilesDir}/shells/invoke -c zsh";
            nix-comfy = "nix develop ${settings.dotfilesDir}/shells/comfy -c zsh";
            nix-pkg-build = "nix build -f default.nix --arg pkgs 'import <nixpkgs> {}'";
            nix-pkg-shell = "nix shell -f default.nix --arg pkgs 'import <nixpkgs> {}'";
            neofetch = "neofetch --source ${settings.dotfilesDir}/user/apps/neofetch/snufkin.txt";
            git-clean = "git clean -xfd; git submodule foreach git clean -xfd";
            ytfzf = "ytfzf -T chafa";
            nekoray = "xhost + local:; sudo nekoray";
            mp = "ncmpcpp";
        };
        initContent = ''
            set -o emacs
            GUIX_PROFILE="/home/serpentian/.config/guix/current"
            . "$GUIX_PROFILE/etc/profile"
        '' + (builtins.readFile ./lib/television/zshrc);
    };

    home.packages = with pkgs; [
        eza
        tldr
    ];
}
