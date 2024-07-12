{
  inputs,
  writeShellScript,
  system,
  stdenv,
  cage,
  swww,
  esbuild,
  dart-sass,
  fd,
  fzf,
  brightnessctl,
  accountsservice,
  slurp,
  wf-recorder,
  wl-clipboard,
  wayshot,
  swappy,
  hyprpicker,
  pavucontrol,
  networkmanager,
  gtk3,
  which,
}: let
  name = "asztal";

  ags = inputs.ags.packages.${system}.default.override {
    extraPackages = [accountsservice];
  };

  dependencies = [
    which
    dart-sass
    fd
    fzf
    brightnessctl
    swww
    # inputs.matugen.packages.${system}.default
    slurp
    wf-recorder
    wl-clipboard
    wayshot
    swappy
    hyprpicker
    pavucontrol
    networkmanager
    gtk3
  ];

  addBins = list: builtins.concatStringsSep ":" (builtins.map (p: "${p}/bin") list);

  desktop = writeShellScript name ''
    export PATH=$PATH:${addBins dependencies}
    ${ags}/bin/ags -b ${name} -c ${config}/config.js $@
  '';

  config = stdenv.mkDerivation {
    inherit name;
    src = ./.;

    buildPhase = ''
      ${esbuild}/bin/esbuild \
        --bundle ./main.ts \
        --outfile=main.js \
        --format=esm \
        --external:resource://\* \
        --external:gi://\* \
    '';

    installPhase = ''
      mkdir -p $out
      cp -r assets $out
      cp -r style $out
      cp -r widget $out
      cp -f main.js $out/config.js
    '';
  };
in
  stdenv.mkDerivation {
    inherit name;
    src = config;

    installPhase = ''
      mkdir -p $out/bin
      cp -r . $out
      cp ${desktop} $out/bin/${name}
    '';
  }
