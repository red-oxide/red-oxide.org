# red-oxide.org

Source for [red-oxide.org](https://red-oxide.org), home of my open-source
projects: a [Zola](https://www.getzola.org) site using the shared
[rivet](https://github.com/red-oxide/rivet) theme, with a dev shell and
formatting from Nix, deployed by Cloudflare Pages.

## Working on it

```sh
git submodule update --init   # fetch rivet into themes/rivet (or clone with --recursive)
nix develop       # Zola and just (or let direnv load it)
just serve        # http://127.0.0.1:1111, reloads on save
just build        # into public/
just check        # Zola's link checks
just fmt          # devfmt's formatters
just update       # update every flake input
just update-rivet # move themes/rivet to rivet's latest commit
```

## Layout

```
content/           home, projects, news, about, license
themes/rivet/      the shared theme (git submodule): templates, styles, palette
static/            logo and favicons, copied as-is
nix/               flake-parts module: dev shell
zola.toml          site config ([extra.rivet] drives nav, hero, footer)
```

## What goes where

Project news lives here: releases, announcements, roadmaps and migration guides,
under `content/news/`. Personal writing and retrospectives go on
[chris.palmerlife.online](https://chris.palmerlife.online). When a post fits
both, publish it once and link it from the other.

Project pages under `content/projects/` use `template = "project.html"` and pull
their docs from each repository at build time; see rivet's `remote_md`
component.

## Static files

`static/` holds the red-oxide mark and favicons, copied from
[red-oxide/.github](https://github.com/red-oxide/.github/tree/main/brand)
(CC BY-SA 4.0): `logo.svg` and `logo-512.png` are `svg/red-oxide-mark.svg` and
`png/red-oxide-mark-512.png`; the rest is `favicon/` as-is. Copy them again
when the logo changes.

## Deployment

Cloudflare Pages builds every push to `master` with `zola build`; it checks out
the rivet submodule itself.

- **Zola version:** set `ZOLA_VERSION` to `extra.zola_version` in `zola.toml`.
- **Nightly rebuild:** the Rebuild site workflow calls the
  `CF_PAGES_DEPLOY_HOOK` secret so project pages pick up their READMEs.

## License

The code is under the [MIT License](LICENSE) and the written content under
[CC BY 4.0](LICENSE-CONTENT).
