{ config, pkgs, ...}:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = ''
[┌─>](bold blue) $all[└─>](bold blue) $character
      '';

      add_newline = true;
      character = {
        error_symbol = "[](bold red)";
        success_symbol = "[](bold blue)";
        vicmd_symbol = "[](bold yellow)";
        format = "$symbol [|](bold bright-black) ";
      };

      hostname = {
        ssh_only = true;
        format = "[$hostname](bold blue) ";
        disabled = false;
      };

      username = {
        show_always = true;
        style_user = "bold blue";
      };

      line_break = {
        disable = true;
      };

      lua = {
        symbol = "[](blue) ";
      };

      c = {
        symbol = " ";
      };

      directory = {
        read_only = " ";
      };

      git_branch = {
        symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      golang = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };
    };
  };
}
