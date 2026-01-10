#import "@preview/prequery:0.2.0"
#import "@preview/zebraw:0.6.1": *

= Generic Template

#prequery.image("https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/lint.yaml/badge.svg", "assets/lint.svg") #prequery.image("https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/test-with-coverage.yaml/badge.svg", "assets/test-with-coverage.svg") #prequery.image("https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/cross-build.yaml/badge.svg", "assets/cross-build.svg") #prequery.image("https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/release-packaging.yaml/badge.svg", "assets/release-packaging.svg") #prequery.image("https://img.shields.io/github/last-commit/yonasBSD/rust-ci-github-actions-workflow", "assets/last-commit.svg") #prequery.image("https://deps.rs/repo/github/yonasBSD/rust-ci-github-actions-workflow/status.svg", "assets/deps-status.svg") #prequery.image("https://img.shields.io/github/release/yonasBSD/rust-ci-github-actions-workflow.svg", "assets/release.svg") #prequery.image("https://img.shields.io/github/license/yonasBSD/rust-ci-github-actions-workflow.svg", "assets/license.svg")

A generic template to base your language-specific templates.

== Features

- #link("https://github.com/features/actions")[GitHub Actions] and #link("https://woodpecker-ci.org")[Woodpecker CI] integration
- #link("https://github.com/evilmartians/lefthook")[lefthook] pre-commit scripts
- #link("https://github.com/j178/prek")[prek] pre-commit scripts
- #link("https://preflight.sh")[preflight] preflight checks
- #link("https://just.systems")[just] and #link("https://taskfile.dev")[go-task] task runners
- #link("https://github.com/comtrya/comtrya")[comtrya] deployment runners
- #link("https://pipelight.dev")[pipelight] CI pipelines
- #link("https://rcl-lang.org")[rcl] and #link("https://kcl-lang.io")[kcl] config languages
- #link("https://json-schema.org")[json], #link("https://toml.io")[toml], and #link("https://yaml.org")[yaml] settings file formats
- #link("https://github.com/BLAKE3-team/BLAKE3")[blake-3] and #link("https://github.com/jedisct1/rsign2")[minisign] cryptographic checksuming and signing of releases
- #link("https://github.com/muandane/goji")[goji] and #link("https://github.com/cocogitto/cocogitto")[cocogitto] conventional / commitizen commit message linting
- #link("https://github.com/crate-ci/typos")[typos] spell checking
- #link("https://github.com/orhun/git-cliff")[git-cliff] keep-a-changelog changelog generator and version bumper
- #link("https://github.com/lycheeverse/lychee")[lychee] link checker
- #link("https://github.com/kristoff-it/superhtml")[superhtml] html linter
- #link("https://github.com/mitsuhiko/minijinja")[minijinja] templating
- #link("https://github.com/numtide/treefmt")[treefmt] and #link("https://github.com/Enter-tainer/typstyle")[typstyle] code formatting
- #link("https://github.com/aquasecurity/trivy")[trivy] and #link("https://github.com/trufflesecurity/trufflehog")[trufflehog] security scanning
- #link("https://github.com/yonasBSD/swab")[swab] file / directory cleaning
- #link("https://github.com/EmbarkStudios/cargo-deny")[cargo-deny] and #link("https://github.com/rust-secure-code/cargo-auditable")[cargo-auditable] license and SBOM management
- #link("https://github.com/ovh/venom")[venom] and #link("https://github.com/Orange-OpenSource/hurl")[hurl] test suites
- #link("https://github.com/yonasBSD/doctave")[doctave], #link("https://github.com/bearcove/dodeca")[doctave], and #link("https://github.com/rust-lang/mdBook")[mdbook] documentation sites
- #link("https://github.com/typst/typst")[typst] citations, footnotes, bibliography, tables, figures, diagrams, graphs, flow charts, math formulas, symbols, emoji, scripting, PDF and HTML exports
- #link("https://github.com/terrastruct/d2")[d2] graphs
- abc and #link("https://github.com/GabAlpha/basilk")[basilk] todo list / kanban manager

== Install

#show: zebraw

```sh
cargo install just
just install
```

== Build

#show: zebraw

```sh
just build
```

== Dependencies

- basilk
- b3sum
- cargo-auditable
- cargo-deny
- cocogitto
- comtrya
- d2
- doctave
- dodeca
- git-cliff
- git-graph
- goji
- go-task
- hurl
- kcl
- just
- lychee
- lefthook
- minijinja
- prek
- preflight
- pipelight
- rcl
- rsign
- superhtml
- swab
- treefmt
- trivy
- trufflehog
- typst
- typstyle
- typos
- venom
