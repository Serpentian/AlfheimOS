{
    stdenv,
    libadwaita,
    lib,
    python3,
    meson,
    ninja,
    pkg-config,
    wrapGAppsHook4,
    docutils,
    desktopToDarwinBundle,
    vte-gtk4,
    gtk4-layer-shell,
    dconf,
    gobject-introspection,
    gsettings-desktop-schemas,
    adwaita-icon-theme,
    gtksourceview5,
    desktop-file-utils,
    webkitgtk_6_0,
    ffmpeg,
    git,
    cmake,
    lsb-release,
    fetchgit,
    fetchurl,
    fetchFromGitHub,

    keepBuildTree,
}:

let
  datasetCsv = fetchurl {
    url = "https://github.com/NyarchLinux/Smart-Prompts/releases/download/0.3/dataset.csv";
    sha256 = "7c40ecee34ea02e4dcad2c479e5036cf417366752f85902cb76360f3303341f0";
  };

  pklFile = fetchurl {
    url = "https://github.com/NyarchLinux/Smart-Prompts/releases/download/0.3/NyaMedium_0.3_256.pkl";
    sha256 = "79c9d3526f84143ddc9d6f7033a5f3e403c4c92937a3aa4bcaca1db5393b75ee";
  };

  tokenizerConfig = fetchurl {
    url = "https://huggingface.co/dleemiller/word-llama-l2-supercat/resolve/main/l2_supercat_tokenizer_config.json";
    sha256 = "bf467c9e0f536bda271283c6ef85eb1a943e3196b621c8a912d64953b205df83";
  };

  live2dTarball = fetchurl {
    url = "https://github.com/NyarchLinux/live2d-lipsync-viewer/releases/download/0.5/pack.tar.xz";
    sha256 = "a2a85f7c75878e88b0ec33946d374a7babdcc8a041196532d5d918d3740f265c";
  };

  archChanPng = fetchurl {
    url = "https://nyarchlinux.moe/acchan.png";
    sha256 = "6e7c3eeda79b0d8a0ca077c81b4f61d40c5010886580f436a25b8f7aadb82f14";
  };

  pip-install-test = python3.pkgs.buildPythonPackage rec {
        pname = "pip-install-test";
        version = "0.5";
        src = fetchurl {
            url = "https://files.pythonhosted.org/packages/15/8e/4fbc92846184e1080af77da38d55928a5486e0bc5e2ec8342c7db378d7f1/pip_install_test-0.5-py3-none-any.whl";
            sha256 =
                "623887f5ce0b4695ec3c0503aa4f394253a403e2bb952417b3a778f0802dbe0b";
        };
        format = "wheel";
        doCheck = false;
        buildInputs = [ ];
        checkInputs = [ ];
        nativeBuildInputs = [ ];
        propagatedBuildInputs = [];
  };

   newspaper3k = python3.pkgs.buildPythonPackage rec {
          pname = "newspaper3k";
          version = "0.2.8";
          src = fetchurl {
            url =
              "https://files.pythonhosted.org/packages/d7/b9/51afecb35bb61b188a4b44868001de348a0e8134b4dfa00ffc191567c4b9/newspaper3k-0.2.8-py3-none-any.whl";
            sha256 =
              "44a864222633d3081113d1030615991c3dbba87239f6bbf59d91240f71a22e3e";
          };
          format = "wheel";
          doCheck = false;
          buildInputs = [ ];
          checkInputs = [ ];
          nativeBuildInputs = [ ];
          propagatedBuildInputs = [
            python3.pkgs.feedparser
            python3.pkgs.tldextract
          ];
        };
  livepng = python3.pkgs.buildPythonPackage rec {
          pname = "livepng";
          version = "0.1.8";
          src = fetchgit {
            url = "https://github.com/FrancescoCaracciolo/LivePNG";
            rev = "${version}";
            hash = "sha256-tmaxwq+qyQ5Hx/pJTzWBj5G+1DWqZ/zsAXJxBWXVh4E=";
          };
        sourceRoot = "LivePNG/src";
        format = "pyproject";
        doCheck = false;
        buildInputs = [ ffmpeg ];
        checkInputs = [ ];
        nativeBuildInputs = [ python3.pkgs.setuptools ];
        propagatedBuildInputs = with python3.pkgs; [
            pydub
            pyaudio
        ];
        };
   wordllama = python3.pkgs.buildPythonPackage rec {
          pname = "wordllama";
          version = "0.3.9";
          src = fetchgit {
            url = "https://github.com/dleemiller/WordLlama";
            rev = "v${version}";
            hash = "sha256-8bZzQ2eMP3VUE8Yak3tmBemR8EwDp0hUCZ3FovQHWkQ=";
          };
        format = "pyproject";
        doCheck = false;
        buildInputs = [ ];
        checkInputs = [ ];
        nativeBuildInputs = with python3.pkgs; [
            setuptools-scm
            setuptools
            cython
        ];
        propagatedBuildInputs = with python3.pkgs; [
            numpy
            safetensors
            tokenizers
            toml
            pydantic
            requests
        ];
        };
  edge-tts = python3.pkgs.buildPythonPackage rec {
    pname = "edge-tts";
    version = "7.0.2";
    src = fetchFromGitHub {
      owner = "rany2";
      repo = "edge-tts";
      tag = "7.0.2";
      hash = "sha256-ZSao6DvCEJAJmxBB5UjvPikcsj9olTQLmrWVX6O+c4g=";
    };
    nativeBuildInputs = [ python3.pkgs.setuptools ];
    propagatedBuildInputs = with python3.pkgs; [
        aiohttp
        certifi
        srt
        tabulate
        typing-extensions
    ];
        pythonImportsCheck = [
            "edge_tts"
            "edge_playback"
        ];
  };

  voicevox-client = python3.pkgs.buildPythonPackage rec {
    pname = "voicevox-client";
    version = "0.4.1";
    src = fetchFromGitHub {
      owner = "voicevox-client";
      repo = "python";
      tag = "v${version}";
      hash = "sha256-cfmb8vmi/L2+6Z+5pBWmmckd0NLNLZ3XeKqPorRXe9k=";
    };
    nativeBuildInputs = [ python3.pkgs.setuptools ];
    propagatedBuildInputs = with python3.pkgs; [
        aiohttp
        typing-extensions
    ];
  };

gpt4all-backend = stdenv.mkDerivation rec {
  pname = "gpt4all-backend";
  version = "3.10.0";

  src = fetchFromGitHub {
    owner = "nomic-ai";
    repo = "gpt4all";
    rev = "v${version}";
    hash = "sha256-OAD/uSCL/3OXmYVG+iGJK4zD2s0dDaPf59DF23AbSFU=";
  };

  sourceRoot = "source/gpt4all-backend";
  nativeBuildInputs = [ cmake keepBuildTree ];

  cmakeFlags = [
     (lib.cmakeBool "LLMODEL_CUDA" false)
     (lib.cmakeBool "LLMODEL_KOMPUTE" false)
     (lib.cmakeBool "KOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER" false)
     (lib.cmakeBool "KOMPUTE_OPT_DISABLE_VULKAN_VERSION_CHECK" true)
     (lib.cmakeBool "KOMPUTE_OPT_USE_BUILT_IN_FMT" false)
  ];

  installPhase = ''
    mkdir -p $out/lib
    cp *.so $out/lib
  '';

  meta = with lib; {
    description = "GPT4All backend C library";
    homepage = "https://github.com/nomic-ai/gpt4all";
    license = licenses.mit;
    platforms = platforms.unix;
  };
};

gpt4all-py = python3.pkgs.buildPythonPackage rec {
  pname = "gpt4all";
  version = "3.10.0";

  src = fetchFromGitHub {
    owner = "nomic-ai";
    repo = "gpt4all";
    rev = "v${version}";
    hash = "sha256-OAD/uSCL/3OXmYVG+iGJK4zD2s0dDaPf59DF23AbSFU=";
    fetchSubmodules = true;
  };

  format = "setuptools";
  sourceRoot = "source/gpt4all-bindings/python";
  patchPhase = ''
 substituteInPlace setup.py \
    --replace 'SRC_CLIB_DIRECTORY = os.path.join("..", "..", "gpt4all-backend")' \
              'SRC_CLIB_DIRECTORY = os.environ.get("GPT4ALL_BACKEND_SRC_DIR", "../../gpt4all-backend")'
  substituteInPlace setup.py \
    --replace 'SRC_CLIB_BUILD_DIRECTORY = os.path.join("..", "..", "gpt4all-backend", "build")' \
              'SRC_CLIB_BUILD_DIRECTORY = os.environ.get("GPT4ALL_BACKEND_BUILD_DIR", "../../gpt4all-backend/build")'
  substituteInPlace setup.py \
    --replace 'DEST_CLIB_DIRECTORY = os.path.join(package_name, f"{LIB_NAME}_DO_NOT_MODIFY")' \
              "DEST_CLIB_DIRECTORY = os.path.join('$out', 'lib/python3.13/site-packages', package_name, f\"{LIB_NAME}_DO_NOT_MODIFY\")"
  '';

  preBuild = ''
    export GPT4ALL_BACKEND_SRC_DIR=${gpt4all-backend}/lib
    export GPT4ALL_BACKEND_BUILD_DIR=${gpt4all-backend}/include
    mkdir -p $out/lib/python3.13/site-packages/gpt4all/llmodel_DO_NOT_MODIFY/build
  '';


  nativeBuildInputs = with python3.pkgs; [
    jinja2
    requests
    tqdm
    typing-extensions
  ];

    pythonImportsCheck = [ "gpt4all" ];
    doCheck = false;
};

  pythonDependencies = with python3.pkgs; [
    pygobject3
    libxml2
    requests
    pydub
    gtts
    speechrecognition
    numpy
    matplotlib
    newspaper3k
    livepng
    wordllama
    edge-tts
    voicevox-client
    gpt4all-py
    lxml
    lxml-html-clean
    pylatexenc
    pyaudio
    openai
    ollama
    llama-index-core
    llama-index-readers-file
    pip-install-test

    # Runtime things
    faiss
    llama-index
  ];
in
  stdenv.mkDerivation rec {
    pname = "nyarchassistant";
    version = "0.9.6";
    format = "other";

    src = fetchgit {
        url = "https://github.com/NyarchLinux/NyarchAssistant";
        rev = "fb41981977c0a824e032d85c62fc52aa578b33e9";
        hash = "sha256-SKZxl5KaP/vJVk0R19YFuGe06YVqV9TquERMSLMcGo0=";
    };

        # strictDeps = true;

    nativeBuildInputs = [
      meson
      ninja
      gobject-introspection # for setup hook populating GI_TYPELIB_PATH
      docutils
      wrapGAppsHook4
      desktop-file-utils
      pkg-config
    ] ++ lib.optional stdenv.hostPlatform.isDarwin desktopToDarwinBundle;

    buildInputs =
      [
        libadwaita
        python3
        gobject-introspection
        vte-gtk4
        dconf
        adwaita-icon-theme
        webkitgtk_6_0
        gtk4-layer-shell
        gsettings-desktop-schemas
        gtksourceview5
        desktop-file-utils
        lsb-release
      ];

    patchPhase = ''
        echo "Patching /usr/share to $out/share in source files..."
        substituteInPlace **/* --replace "/usr/share" "$out/share" || true
        substituteInPlace src/handlers/smart_prompt/smart_prompt.py \
            --replace "/usr/share" "$out/share"
    '';

    preFixup = ''
     glib-compile-schemas $out/share/gsettings-schemas/${pname}-${version}/glib-2.0/schemas
     gappsWrapperArgs+=(
     --set PYTHONPATH "${python3.pkgs.makePythonPath pythonDependencies}"

     # Add multiple package binaries to PATH
     --prefix PATH : ${lib.makeBinPath [
                python3.pkgs.pip
                python3
                ffmpeg
                git
            ]}
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [
        gtk4-layer-shell
      ]}
      )
     patchShebangs $out/bin
     '';

postInstall = ''
  mkdir -p $out/share/nyarchassistant
  cp ${datasetCsv} $out/share/nyarchassistant/dataset.csv
  mkdir -p $out/share/nyarchassistant/data/smart-prompts
  cp ${pklFile} $out/share/nyarchassistant/data/smart-prompts/NyaMedium_0.3_256.pkl
  cp ${tokenizerConfig} $out/share/nyarchassistant/data/smart-prompts/l2_supercat_tokenizer_config.json

    # live2d resources extraction and move
    mkdir -p $out/share/nyarchassistant/data/live2d/web
    tar -xJf ${live2dTarball} -C $out/share/nyarchassistant/data/live2d/web --no-same-owner
    cp ${archChanPng} $out/share/nyarchassistant/data/live2d/web/arch-chan.png
'';

    meta = with lib; {
      homepage = "https://github.com/NyarchLinux/NyarchAssistant";
      description = "Nyarch Assistant - Your ultimate Waifu AI Assistant ";
      mainProgram = "nyarchassistant";
      license = licenses.gpl3;
      platforms = platforms.unix;
    };
  }
