+++
title = "pressbox-darwin 26.0.0"
description = "The first release of the pressbox iPhone app: feeds, articles and podcasts from your own server. TestFlight only for now."
date = 2026-11-21

[taxonomies]
tags = ["pressbox", "pressbox-darwin", "release", "ios", "podcasts"]
+++

[pressbox-darwin](@/projects/pressbox-darwin.md) 26.0.0 is tagged: the first
release of the iPhone app for [pressbox](@/projects/pressbox.md). It reads your
feeds, articles and podcasts from your own pressbox server, and shares read,
starred, playback position and Up Next with every other client.

<!-- more -->

> [!NOTE]
> This release is on TestFlight only, and not yet on the App Store. There's no
> public TestFlight link either, so for now it's a marker for a tested build
> rather than something you can install. It'll go to the App Store as soon as I
> can submit it.

## What's in it

**Reading.** Feeds and items are grids of tiles, with artwork where there is
some. The feed list is in sections by the tags in your server's config, and News
and Podcasts toggles narrow every list to one or the other. There's search,
offline reading, and Mark All as Read with an undo that doesn't need the server.

**Podcasts.** Audio plays in the background with Lock Screen and Control Center
controls; video plays inline, full screen or in picture in picture. The full
player has chapters, a transcript that follows along, speeds that keep the
pitch, AirPlay and a sleep timer, and each podcast remembers its own speed.
Episodes resume wherever any client left off.

**Up Next and downloads.** Up Next lives on the server, so the iPhone, terminal
and desktop clients all share one queue. The newest unread episodes download
automatically (Wi-Fi only, unless you say otherwise), and any episode's audio or
video can be downloaded from its page.

**Offline.** Marking, starring, positions and Up Next changes made without a
connection wait on the device and are sent when the server can be reached again.
Settings shows whether it's connected, and how many changes are waiting.

**Around the system.** Unread and Up Next widgets (on the Lock Screen too), Siri
and Shortcuts for playback, a Control Center play/pause control, Face ID lock
and an unread badge.

**Looks.** [Birdland](@/projects/birdland.md) colors throughout, Liquid Glass
sheets and toolbars, and the home-plate icon in the dark, clear and tinted
styles.

The
[changelog](https://github.com/red-oxide/pressbox-darwin/blob/v26.0.0/CHANGELOG.md)
has the full list, and the
[release](https://github.com/red-oxide/pressbox-darwin/releases/tag/v26.0.0) a
shorter one.

## What it needs

iOS 27 and a server running [pressbox 26.0.0](@/news/pressbox-26.0.0.md) or
later. The app is versioned on its own, with the same calendar versions as the
server, and talks to it through API v1.

## What's next

This release is iPhone only. Apple TV and Apple Watch apps come first: the TV
one for podcasts and video. iPad and Mac follow after that. It's all tracked in
[issues](https://github.com/red-oxide/pressbox-darwin/issues).
