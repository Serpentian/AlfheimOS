{
    alsa-lib,
    dbus,
    pkg-config,
    buildGoModule,
    fetchgit,
}: let
    version = "1.0.6";
in buildGoModule {
    pname = "subsonic-tui";
    version = version;

    src = fetchgit {
        url = "https://github.com/mrusme/neonmodem.git";
        rev = "v${version}";
        fetchSubmodules = true;
        hash = "sha256-VLR6eicffA0IXVwEZMvgpm1kVmrLYVZOtq7MSy+vIw8=";
    };

    vendorHash = "sha256-pESNARoUgfg5/cTlTvKF3i7dTMIu0gRG/oV4Ov6h2cY=";
}
