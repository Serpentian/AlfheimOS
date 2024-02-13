{ config, pkgs, ...}:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "Nikita Zheleztsov";
  programs.git.userEmail = "n.zheleztsov@proton.me";
  programs.git.extraConfig = {
    core.editor = "nvim";
  };
}
