{...}:
{
    services.openssh = {
        enable = true;
        ports = [ 22 ];
        settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
            AllowUsers = [ "serpentian" ];
        };
    };
}
