{ settings, config, pkgs, ... }:

{
  imports = [
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
      vim = "nvim";
      v = "vim";
      mv = "mv -v";
      cp = "cp -vr";
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
    initExtra = ''
      set -o emacs
    '';
  };

  home.packages = with pkgs; [
    eza
    bat
  ];
}
