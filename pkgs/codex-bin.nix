{
  lib,
  stdenvNoCC,
  fetchurl,
  autoPatchelfHook,
  glibc,
  installShellFiles,
  versionCheckHook,
  zstd,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "codex-bin";
  version = "0.167.0";

  src = fetchurl {
    url = "https://github.com/openai/codex/releases/download/rust-v${finalAttrs.version}/codex-package-x86_64-unknown-linux-musl.tar.zst";
    hash = "sha256-n2e4hoixQ1kH4hSIWI/yAR/f8n5YLS05XohVv1Z6jP8=";
  };

  nativeBuildInputs = [ autoPatchelfHook installShellFiles zstd ];
  # The CLI is static; the bundled voice helper needs NixOS's loader and libc.
  buildInputs = [ glibc ];

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    runHook preInstall

    # Keep the package layout so Codex can locate its runtime helpers.
    mkdir -p "$out"
    tar --zstd -xf "$src" -C "$out"
    installShellCompletion --cmd codex \
      --bash <("$out/bin/codex" completion bash) \
      --fish <("$out/bin/codex" completion fish) \
      --zsh <("$out/bin/codex" completion zsh)

    runHook postInstall
  '';

  doInstallCheck = true;
  nativeInstallCheckInputs = [ versionCheckHook ];
  versionCheckProgram = "${placeholder "out"}/bin/codex";

  meta = {
    description = "OpenAI Codex CLI, packaged from the official release binaries";
    homepage = "https://github.com/openai/codex";
    license = lib.licenses.asl20;
    mainProgram = "codex";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
})
