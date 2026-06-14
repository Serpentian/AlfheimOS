{...}: let
    ipc = "noctalia msg";
in {
    launchCommands = [
        "noctalia &"
    ];
    binds = {
        launcher = "${ipc} panel-toggle launcher";
    };
}
