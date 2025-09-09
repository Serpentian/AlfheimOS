{
lib,
stdenv,
fetchFromGitHub,
cmake,
gtest,
zlib,
}:

stdenv.mkDerivation rec {
    name = "msgpuck";

    src = fetchFromGitHub {
        owner = "tarantool";
        repo = "msgpuck";
        rev = "0d90633c1b31de9bc63416b501159734b5213af5";
        hash = "sha256-eiNAxYTgGthkMQoP/ZaR3hYNYGnRtgNDEVsYGL4/CTA=";
    };

    strictDeps = true;

    nativeBuildInputs = [
        cmake
    ];

    checkInputs = [
        gtest
        zlib
    ];

    doCheck = stdenv.buildPlatform.canExecute stdenv.hostPlatform;
}
