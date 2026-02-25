{pkgs, ...}:
{
    home.packages = with pkgs; [
        supertuxkart
        # zeroad
        wesnoth
        xonotic
        luanti
        airshipper
        pioneer
    ];
}
