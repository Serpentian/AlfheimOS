{pkgs, ...}:
{
    home.packages = with pkgs; [
        sweethome3d.application
        sweethome3d.textures-editor
        sweethome3d.furniture-editor
    ];
}
