{ lib
, buildGoModule
, fetchFromGitHub
, cairo
, gobject-introspection
, gtk3
, gtk-layer-shell
, pkg-config
, wrapGAppsHook
, xdg-utils }:

buildGoModule rec {
  pname = "nwg-drawer";
  version = "0.4.6";

  src = fetchFromGitHub {
    owner = "nwg-piotr";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-BxYd40imGFgdSc4+JSYUMJ3/jHz1UyAy72DmzXU4UzA=";
  };

  vendorHash = "sha256-w27zoC0BwTkiKyGVfNWG0k4tyTm5IIAthKqOyIMYBZQ=";

  patches = [ ./patches/nwg-drawer-power-icons.diff ];

  buildInputs = [ cairo gtk3 gtk-layer-shell ];
  nativeBuildInputs = [ pkg-config wrapGAppsHook gobject-introspection ];

  doCheck = false;

  preInstall = ''
    mkdir -p $out/share/nwg-drawer
    cp -r desktop-directories img drawer.css $out/share/nwg-drawer
  '';

  preFixup = ''
    # make xdg-open overrideable at runtime
    gappsWrapperArgs+=(
      --suffix PATH : ${xdg-utils}/bin
      --prefix XDG_DATA_DIRS : $out/share
    )
  '';

  meta = with lib; {
    description = "Application drawer for sway Wayland compositor";
    homepage = "https://github.com/nwg-piotr/nwg-drawer";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "nwg-drawer";
    maintainers = with maintainers; [ plabadens ];
  };
}

