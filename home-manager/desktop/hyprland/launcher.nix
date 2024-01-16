{ custom, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-power-menu
    nwg-drawer
  ];

  programs.rofi = {
    enable = true;
    cycle = false;
    package = pkgs.rofi-wayland;
    font = "${custom.font}" + " 14";
    terminal = "kitty";
    extraConfig = {
      modi = "drun,window,run,power-menu:rofi-power-menu";
      show-icons = true;
      display-drun = "";
      display-run = "";
      display-power-menu = "";
      display-window = "";
      drun-display-format = "{name}";
      window-format = "{w}{t}";
      hover-select = true;
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
      img = "~/.dotfiles/non-nix/wallpapers/evening-sky-rofi.png";
    in {
      window = {
          height = mkLiteral "600px";
          width = mkLiteral "900px";
          transparency = "real";
          fullscreen = false;
          enabled = true;
          cursor = "default";
          spacing = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "2px";
          border-radius = mkLiteral "15px";
          border-color = mkLiteral "#${custom.primary_accent}";
          background-color = mkLiteral "transparent";
      };
      mainbox = {
          enabled = true;
          spacing = mkLiteral "0px";
          padding = mkLiteral "0px";
          orientation = mkLiteral "vertical";
          children = map mkLiteral [ "inputbar" "listbox" ];
          background-color = mkLiteral "transparent";
          background-image = mkLiteral "url(\"${img}\", height)";
      };

      inputbar = {
          enabled = true;
          spacing = mkLiteral "0px";
          padding = mkLiteral "80px";
          children = map mkLiteral [ "entry" ];
          background-color = mkLiteral "#${custom.palette.primary_background_hex}";
          background-image = mkLiteral "url(\"${img}\", width)";
      };
      entry = {
          border-radius = mkLiteral "30px";
          enabled = true;
          spacing = mkLiteral "0px";
          padding = mkLiteral "20px";
          text-color = mkLiteral "#${custom.tertiary_accent}";
          background-color = mkLiteral "#${custom.palette.tertiary_background_hex}";
      };

      listbox = {
          padding = mkLiteral "30px";
          spacing = mkLiteral "0px";
          orientation = mkLiteral "horizontal";
          children = map mkLiteral [ "listview" "mode-switcher" ];
          background-color = mkLiteral "#${custom.palette.primary_background_hex}";
      };
      listview = {
          padding = mkLiteral "10px";
          spacing = mkLiteral "10px";
          enabled = true;
          columns = 2;
          cycle = true;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;
          cursor = "default";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${custom.tertiary_accent}";
      };
      mode-switcher = {
          orientation = mkLiteral "vertical";
          width = mkLiteral "95px";
          enabled = true;
          padding = mkLiteral "15px";
          spacing = mkLiteral "10px";
          background-color = mkLiteral "transparent";
      };
      button = {
          cursor = mkLiteral "pointer";
          border-radius = mkLiteral "50px";
          text-color = mkLiteral "#${custom.tertiary_accent}";
          background-color = mkLiteral "#${custom.palette.tertiary_background_hex}";
      };
      "button selected" = {
          background-color = mkLiteral "#${custom.secondary_accent}";
          text-color = mkLiteral "#${custom.background}";
      };

      element = {
          enabled = true;
          spacing = mkLiteral "20px";
          padding = mkLiteral "9px";
          border-radius = mkLiteral "25px";
          cursor = mkLiteral "pointer";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${custom.tertiary_accent}";
      };
      "element selected.normal" = {
          background-color = mkLiteral "#${custom.secondary_accent}";
          text-color = mkLiteral "#${custom.background}";
      };
      element-icon = {
          size = mkLiteral "47px";
          cursor = mkLiteral "inherit";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
      };
      element-text = {
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          cursor = mkLiteral "inherit";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
      };
    };
  };

  home.file.".config/nwg-drawer/drawer.css".text = ''
    window {
        background-color: rgba (17, 17, 27, 0.80);
        color: rgb(205, 214, 244)
    }

    /* search entry */
    entry {
        background-color: rgba (0, 0, 0, 0.2)
    }

    button, image {
        background: none;
        border: none;
        color: rgb(205, 214, 244)
    }

    image {
        padding-bottom: 10px;
    }

    button:hover {
        background-color: rgba (255, 255, 255, 0.1)
    }

    /* in case you wanted to give category buttons a different look */
    #category-button {
        margin: 0 10px 0 10px
    }

    #pinned-box {
        padding-bottom: 15px;
        border-bottom: 1px dotted gray
    }

    #files-box {
        padding: 5px;
        border: 1px dotted gray;
        border-radius: 15px
    }
  '';
}
