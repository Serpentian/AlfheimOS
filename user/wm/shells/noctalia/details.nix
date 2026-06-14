{...}: let
    ipc = "noctalia msg";
in {
    launchCommands = [
        "noctalia &"
    ];
    binds = {
        launcher = "${ipc} panel-toggle launcher";
        volumeUp = "${ipc} volume-up 2";
        volumeDown = "${ipc} volume-down 2";
        brightnessUp = "${ipc} brightness-up current 5";
        brightnessDown = "${ipc} brightness-down current 5";
        lock = "${ipc} session lock";
        screenshot = "${ipc} screenshot-region";
        micMute = "${ipc} mic-mute";
        mediaNext = "${ipc} media next";
        mediaPrev = "${ipc} media previous";
        mediaToggle = "${ipc} media toggle";
    };
}
