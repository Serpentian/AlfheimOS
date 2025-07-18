{pkgs, ...}:

{
    home.packages = [
        (pkgs.writeScriptBin "game-session-mangohud"
            (builtins.readFile ./game-session-mangohud.sh))
        (pkgs.writeScriptBin "game-session"
            (builtins.readFile ./game-session.sh))
        pkgs.dualsensectl
        pkgs.bottles
    ];
}
