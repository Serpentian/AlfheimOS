{ config, pkgs, ... }:

{
  imports =
    [
      ./starship.nix
    ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
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
    };
    initExtra = "set -o emacs";
  };

  home.packages = with pkgs; [
    eza
  ];
}
