{ config, pkgs, ... }:

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
      vim = "nvim";
      v = "vim";
      mv = "mv -v";
      cp = "cp -vr";
      rm = "rm -rv";
      w3md = "w3m https://lite.duckduckgo.com/lite/";
      nix-tarantool = "nix develop ~/.dotfiles/shells/tarantool -c zsh";
      nix-python = "nix develop ~/.dotfiles/shells/python -c zsh";
      nix-lampray = "nix develop ~/.dotfiles/shells/lampray -c zsh";
      neofetch = "neofetch --source ~/.dotfiles/user/apps/neofetch/snufkin.txt";
    };
    initExtra = ''
      set -o emacs
    '';
  };

  home.packages = with pkgs; [
    eza
  ];
}
