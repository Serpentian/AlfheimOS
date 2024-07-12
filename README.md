<h2 align="center">❄️  AlfheimOS ❄️ </h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

<p align="center">
	<a href="https://github.com/ryan4yin/nix-config/stargazers">
		<img alt="Stargazers" src="https://img.shields.io/github/stars/serpentian/AlfheimOS?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://nixos.org/">
        <img src="https://img.shields.io/badge/NixOS-23.11-informational.svg?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"></a>
</p>


This repository is home to the Nix code that builds my systems. Issues, PRs
and questions are welcome!

If you are from Lemmy or Reddit and want to check config from the screenshot,
please, go to [this branch](https://github.com/Serpentian/AlfheimOS/tree/catppuccin-reddit);

## Modules

The config is modular, you can either specify settings inside [`flake.nix`](https://github.com/Serpentian/AlfheimOS/blob/master/flake.nix) or/and
exclude/include some modules inside profiles directory with:

```nix
imports = [
    ./import1.nix
    ./import2.nix
    ...
];
```

## Profiles

The configuration is separated into several profiles:
* Personal - personal laptop/desktop
* Work - work laptop (included in the Personal profile, as I work from home)

Each profile contains a `configuration.nix` for system-level configuration and a
`home.nix` for user-level configuration. Setting the `profile` variable in
[`flake.nix`](https://github.com/Serpentian/AlfheimOS/blob/master/flake.nix) automatically sources the correct `configuration.nix` and `home.nix`.

## Install

I suppose, you already installed NixOS. To get this config running, start by
cloning the repo:

```
git clone https://github.com/Serpentian/AlfheimOS.git ~/.dotfiles
```

To get the hardware configuration on a new system, either copy from
`/etc/nixos/hardware-configuration.nix` or run:

```
cd ~/.dotfiles
sudo nixos-generate-config --show-hardware-config > profiles/desktop/hardware-configuration.nix
```

Don't use my hardware configuration, your system won't boot!

Now, it's time to configure `settings.nix` (and probably profiles) to your liking.
Once the variables are set, then switch into the system configuration by running:

```
cd ~/.dotfiles
sudo nixos-rebuild switch --flake .
```

Home manager can be installed with:

```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

If home-manager starts to not cooperate, it may be because the unstable branch
of nixpkgs is in the Nix channel list. This can be fixed via:

```
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
```

Home-manager may also not work without re-logging back in after it has been
installed. Once home-manager is running, the home-manager configuration can be
installed with:

```
cd ~/.dotfiles
home-manager switch --flake .
```

## Themes

In the future several themes will be introduced, but now only one is supported:

![Screen](./assets/catppuccin/overview.png)

## Credits
* [librephoenix/nixos-config](https://github.com/librephoenix/nixos-config?tab=readme-ov-file) - The repo structure is heavily inspired by this repo.
  Also, check out his [NixOS videos](https://piped.video/channel/UCeZyoDTk0J-UPhd7MUktexw), fantastic entry point to NixOS.
