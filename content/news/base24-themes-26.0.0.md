+++
title = "base24-themes 26.0.0"
description = "The first release of base24-themes: twelve Base24 color schemes for Nix, each tested for readable contrast, with format converters and a NixOS and Home Manager module."
date = 2026-11-22

[taxonomies]
tags = ["base24-themes", "release", "nix", "nixos", "home-manager", "theming"]
+++

[base24-themes](@/projects/base24-themes.md) 26.0.0 is tagged: the first release
of my Base24 color schemes for Nix. It ships twelve themes, converters to the
formats my desktop and apps read them in, and one module for NixOS and Home
Manager.

<!-- more -->

## What's in it

**Twelve themes, in six pairs.** Each has a dark variant and a `-light` one:

- **Birdland**: black, cream and bird orange, with ballpark seat green and
  warehouse brick. It's the default, and the colors of
  [birdland](@/projects/birdland.md) and the pressbox apps.
- **Spangled**: for Frederick, Maryland, the hometown of Francis Scott Key:
  orange, black and the red and gold of fireworks over night-sky navy.
- **Eastern Shore**: black, silver and orange, with beach sand, marsh grass and
  bay water.
- **Blue Crab**: the Chesapeake Bay. Crab teal, claw orange and Maryland flag
  red and gold over deep bay water.
- **Harbor**: Norfolk's naval harbor. Battleship gray, sea foam, tidal green and
  signal orange.
- **Red Oxide**: the colors of the red-oxide logo, a rusted steel home plate:
  oxide red, dark oxide and plate white.

The
[gallery](https://github.com/red-oxide/base24-themes/blob/v26.0.0/docs/gallery.md)
shows all twelve, each linking to its full palette.

**Readable by test.** Every accent, `base08` to `base0F`, reaches WCAG AA
contrast (4.5:1) on the background, and on the panels too for every theme but
Birdland. `nix flake check` computes the real contrast ratios, in pure Nix, and
fails if a theme falls short. The same `contrastRatio` and `luminance` functions
are in the library for checking your own themes.

**Converters.** `toYaml` (the tinted-theming scheme format), `toJson`, `toScss`,
`toQml` (a `pragma Singleton` for Quickshell and other QML), and `toSvg` and
`toCardSvg` for the preview images. The library needs only nixpkgs' `lib`, so it
works without flakes too.

**One module for NixOS and Home Manager.** Pick a bundled theme or pass your
own, and use its colors anywhere in your configuration as `config.lib.base24`.
It's exported as `nixosModules.default` and `homeModules.default`;
`homeManagerModules` still works as the older name.

The
[changelog](https://github.com/red-oxide/base24-themes/blob/v26.0.0/CHANGELOG.md)
has everything.

## Getting it

Pin the release and import the module:

```nix
{
  inputs.base24-themes = {
    url = "github:red-oxide/base24-themes/v26.0.0";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
```

```nix
{ inputs, config, ... }:
{
  imports = [ inputs.base24-themes.homeModules.default ];

  base24.theme = "red-oxide";

  # config.lib.base24.colors.base08 -> "dc5a3e"
  # config.lib.base24.qml           -> a QML singleton with every color
}
```

The
[usage guide](https://github.com/red-oxide/base24-themes/blob/v26.0.0/docs/usage.md)
covers the library, defining your own theme, and the module's options.

## Version numbers

base24-themes uses the same calendar versions as
[pressbox](@/news/pressbox-26.0.0.md) and [devfmt](@/news/devfmt-26.0.0.md):
`YY.MINOR.PATCH`, so 26.0.0 is the first release of 2026.
