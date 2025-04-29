{ settings, config, pkgs, ... }:

{
    imports = [
        ./bat.nix
        ./television
        ./starship.nix
    ];

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
            gd = "git diff";
            gl = "git log";
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
            neofetch = "neofetch --source ${settings.dotfilesDir}/user/apps/neofetch/snufkin.txt";
            ytfzf = "ytfzf -T chafa";
            nekoray = "xhost + local:; sudo nekoray";
            mp = "ncmpcpp";
        };
        initContent = ''
            set -o emacs
        '' + (builtins.readFile ./television/zshrc);
    };

    home.packages = with pkgs; [
        eza
    ];
}
