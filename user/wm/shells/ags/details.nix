{...}:
rec {
    launchCommands = [
        "awww-daemon &"
        "ags &"
    ];
    binds = {
        launcher = "ags -t launcher";
    };
}
