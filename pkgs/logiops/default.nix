{ lib, stdenv, fetchFromGitHub, pkg-config, cmake, udev, libevdev, libconfig, glib }:

stdenv.mkDerivation rec {
  pname = "logiops";
  version = "0.3.1";

   src = fetchFromGitHub {
    owner = "pixlone";
    repo = "logiops";
    rev = "a77b328b35169f4c97c343be5500c982c9e58fbd";
    sha256 = "sha256-1KrehE+eHXPth4kVHh1HZgqZqL+2Fi+k3IhPKunINXs=";
    fetchSubmodules = true;
  };

  PKG_CONFIG_SYSTEMD_SYSTEMDSYSTEMUNITDIR = "${placeholder "out"}/lib/systemd/system";

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ udev libevdev libconfig glib ];

  meta = with lib; {
    description = "Unofficial userspace driver for HID++ Logitech devices";
    homepage = "https://github.com/PixlOne/logiops";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ ckie ];
    platforms = with platforms; linux;
  };
}
