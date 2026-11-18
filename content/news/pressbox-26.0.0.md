+++
title = "pressbox 26.0.0"
description = "The first release of pressbox, a self-hosted feed aggregator configured in NixOS, now with podcasts."
date = 2026-11-17

[taxonomies]
tags = ["pressbox", "release", "nixos", "rss", "podcasts"]
+++

[pressbox](/projects/pressbox/) 26.0.0 is out: the first tagged release of my
self-hosted feed aggregator. You declare feeds, and the people reading them, in
your NixOS configuration; a small Rust server polls them, and every client
shares read and starred state through its API.

<!-- more -->

## What's in it

**The server.** `pressboxd` reads RSS, Atom and JSON Feed with conditional
requests, backoff and sanitized HTML. Feeds can be shared or per user, and each
user has their own read and starred state, devices and pairings. It can fetch
full articles for feeds that only carry a summary, keeps items by count or age
(starred ones always stay), and has full-text search. It runs as a systemd
service with socket activation, credentials, a watchdog and a backup timer.

**Podcasts.** Episodes carry their audio and video, including Podcasting 2.0
alternate enclosures, chapters and transcripts, which the server reads into one
JSON shape so clients don't have to. Playback position is kept per item, and
each user has an Up Next queue that every client shares.

**Clients.** A terminal reader (`pressbox`, built with ratatui) and a desktop
reader (`pressbox-iced`), both able to play podcasts and work the Up Next queue.
Devices pair with a short code, approved from a signed-in device or with
`pressboxctl`, so there's no website and no shared password.

**`pressboxctl`.** Users, devices, pairing, refreshes, backups, OPML export,
`opml-to-nix` for bringing over an existing subscription list, and `discover` to
find a site's feeds.

The [changelog](https://github.com/red-oxide/pressbox/blob/master/CHANGELOG.md)
has everything, and the
[release notes](https://github.com/red-oxide/pressbox/releases/tag/v26.0.0) the
same list.

## Getting it

Add the flake, pinned to the release, and import its NixOS module:

```nix
{
  inputs.pressbox = {
    url = "github:red-oxide/pressbox/v26.0.0";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
```

```nix
{
  imports = [ inputs.pressbox.nixosModules.default ];

  services.pressbox = {
    enable = true;
    feeds.nixos = "https://nixos.org/blog/announcements-rss.xml";
  };
}
```

The
[server guide](https://github.com/red-oxide/pressbox/blob/master/docs/server.md)
covers users, options and pairing, and the
[clients guide](https://github.com/red-oxide/pressbox/blob/master/docs/clients.md)
the Home Manager module for the terminal and desktop clients and the
[Birdland](/projects/birdland/) bar.

> [!NOTE]
> pressbox is in its early days. Expect rough edges, and configuration and
> behavior that may change between versions.

## Version numbers

Releases use calendar versions, `YY.MINOR.PATCH`: the year, then a count of that
year's releases and of fixes to each. So 26.0.0 is the first release of 2026,
26.0.1 would be a fix to it, and the first release in January will be 27.0.0.
The numbers say when, not how much changed. The HTTP API is versioned on its
own, as the `v1` in `/api/v1`.

## What's next

The [Apple](/projects/pressbox-darwin/) and
[Android](/projects/pressbox-android/) apps aren't released yet; they have their
own repositories and will have their own releases. Much of the next server work
is for them: syncing only what changed since a point in time, an artwork cache,
managing devices over the API, feed categories, and more of Podcasting 2.0
(person, funding, podroll, live items, value). Pushing changes to clients with
server-sent events and a guide for running pressboxd outside NixOS are on the
list too. It's all tracked in
[issues](https://github.com/red-oxide/pressbox/issues).
