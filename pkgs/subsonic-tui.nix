{
    alsa-lib,
    dbus,
    pkg-config,
    buildGoModule,
    fetchgit,
}:
buildGoModule {
    pname = "subsonic-tui";
    version = "0.0.0";

    src = fetchgit {
        url = "https://git.dayanhub.com/sagi/subsonic-tui.git";
        rev = "3ab3eb65d6387ecc7f159a870f8a88edd774980a";
        fetchSubmodules = true;
        hash = "sha256-49RegzA7t96u90OXHlriBz4IbQVEsWPNarKjR2ms/mg=";
    };

    vendorHash = "sha256-yj28swhgAI2LxeIa2FHFzyMVX6yTB48jg/wno3fS2h0=";
    buildInputs = [ dbus alsa-lib ];
    nativeBuildInputs = [ pkg-config ];
}
