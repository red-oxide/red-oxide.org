+++
title = "Hello, red-oxide"
description = "red-oxide.org is the new home for my open-source projects and their news."
date = 2026-11-12

[taxonomies]
tags = ["red-oxide", "announcement"]
+++

red-oxide is the new home for the open-source projects I build and maintain.
They used to live under my personal GitHub account; they're now together in the
[red-oxide organization](https://github.com/red-oxide), with this site for their
documentation and news.

<!-- more -->

## The projects

- [pressbox](@/projects/pressbox.md): a self-hosted RSS, Atom and JSON Feed
  aggregator, configured in NixOS, with terminal and desktop clients.
- [pressbox-darwin](@/projects/pressbox-darwin.md): the SwiftUI app for
  pressbox on iPhone, iPad and Mac.
- [pressbox-android](@/projects/pressbox-android.md): the Jetpack Compose app
  for pressbox on Android.
- [birdland](@/projects/birdland.md): a modular Quickshell desktop shell for
  Niri, managed with Nix and Home Manager.
- [base24-themes](@/projects/base24-themes.md): Base24 color schemes for Nix,
  with format converters and a NixOS and Home Manager module.
- [devfmt](@/projects/devfmt.md): one formatting setup for all of these repos, a
  flake-parts module built on treefmt-nix.

Each project page pulls its documentation straight from the repository when the
site builds, so it stays in step with the code.

## Moving from chrisppy

The repositories moved from `github.com/chrisppy` to `github.com/red-oxide`.
GitHub redirects the old URLs, but if you use any of these as a flake input,
point it at the new owner, e.g. `github:red-oxide/pressbox`, rather than
relying on the redirect.

## What you'll find here

Project news: releases, announcements, roadmaps and migration guides. Personal
writing and everything else stays on
[chris.palmerlife.online](https://chris.palmerlife.online).

To follow along, subscribe to the [news feed](/news/atom.xml), or to
[everything on the site](/atom.xml). It reads nicely in
[pressbox](@/projects/pressbox.md).

## The logo

The mark is a rusted steel home plate: oxide red, riveted, with "RO" on it. It
doubles as the favicon, and it's under
[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/); the files are
in [red-oxide/.github](https://github.com/red-oxide/.github/tree/main/brand).
The rest of the site is covered on the [license](@/license.md) page.
