{pkgs, ...}:
{
    home.packages = with pkgs; [
        ytfzf
        # ueberzugpp
        chafa
    ];
    home.file.".config/ytfzf/conf.sh".text = ''
show_thumbnails=1

video_player () {
    case "$is_detach" in
        0) DISPLAY= mpv --no-config --really-quiet --vo=tct "$@" ;;
        1) mpv "$@" ;;
    esac
}
    '';
}
