+++
title = "devfmt 26.0.0"
description = "The first release of devfmt, the treefmt setup every red-oxide repo is formatted with, now tested against a sample of every language it formats."
date = 2026-11-22

[taxonomies]
tags = ["devfmt", "release", "nix", "flake-parts", "treefmt"]
+++

[devfmt](@/projects/devfmt.md) 26.0.0 is tagged: the first release of the
formatting setup behind every red-oxide repository. It's a flake-parts module on
treefmt-nix, so a flake that uses it gets `nix fmt` for the whole tree and a
`nix flake check` that fails when anything isn't formatted.

<!-- more -->

## What's in it

**Formatters for each language.** Nix (deadnix, statix, nixf-diagnose and
nixfmt-rs), Rust, C and C++, Go, shell and fish, Swift, Kotlin, QML, TOML,
justfiles, LaTeX, XML and Apple property lists, Markdown, JSON, YAML, CSS and
Sass, and Tera HTML templates.

**Every file is formatted by something.** A file no formatter handles fails
`nix fmt` and the check, so new file types can't slip in unformatted. License
texts, images, fonts, Gradle's wrapper and a few others are excluded everywhere,
and a project can add its own exclusions.

**One line to use it.** `devfmt.lib.mkFlake` is flake-parts' `mkFlake` with
devfmt included, the default systems, and `pkgs` from your own `nixpkgs`. Flakes
that already use flake-parts can import `flakeModules.default` instead.

**Tested formatters.** devfmt's own checks run every formatter over a small
sample of each language and fail if any of them changes, or leaves a file
behind. That caught two bugs before this release: golangci-lint couldn't find
Go, so it failed on any Go file in `nix flake check`, and latexindent left an
`indent.log` in the repository. Both are fixed. CI runs the checks on every push
and pull request.

**Pinned inputs are watched.** import-tree and nixfmt-rs are pinned to release
tags, which `nix flake update` never moves. A weekly workflow opens an issue
when either has a newer release, and `just outdated` shows the same list.

The [changelog](https://github.com/red-oxide/devfmt/blob/v26.0.0/CHANGELOG.md)
has everything.

## Getting it

Pin the release and build the flake with `lib.mkFlake`:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devfmt = {
      url = "github:red-oxide/devfmt/v26.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.devfmt.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.devfmt.lib.importTree ./nix) ];
    };
}
```

`github:red-oxide/devfmt` without a tag still follows master.

## Version numbers

devfmt uses the same calendar versions as [pressbox](@/news/pressbox-26.0.0.md):
`YY.MINOR.PATCH`, so 26.0.0 is the first release of 2026.
