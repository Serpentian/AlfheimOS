{
    lib,
    libGL,
    libX11,
    mpv-unwrapped,
    buildGoModule,
    fetchFromGitHub,
}:
buildGoModule {
    pname = "stmp";
    version = "0.0.3";

    src = fetchFromGitHub {
        owner = "wildeyedskies";
        repo = "stmp";
        rev = "2d5b0daf90f42c6f86ed23497c761ec2bd5ca07c";
        hash = "sha256-cIozKuMaAt2dlcOGCG5qYL3NShHAqYxgZVagPhM+E2U=";
    };

    vendorHash = "sha256-53Oat/48PtOXtITxU5j1VmHy0vCB6UzyqjDzkfZFrYI=";
    buildInputs = [ mpv-unwrapped libGL libX11];
}
