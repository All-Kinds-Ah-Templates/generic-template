# Generic Template

A generic template to base your language-specific templates.

## Features
  - [GitHub Actions](https://github.com/features/actions) integration
  - [Woodpecker CI](https://woodpecker-ci.org) integration
  - [lefthook](https://github.com/evilmartians/lefthook) pre-commit scripts
  - [just](https://just.systems) and [go-task](https://taskfile.dev) task runners
  - [pipelight](https://pipelight.dev) CI pipelines
  - [goji](https://github.com/muandane/goji) and [cocogitto](https://github.com/cocogitto/cocogitto) conventional / commitizen commit message linting
  - [typos](https://github.com/crate-ci/typos) spell checking
  - [git-cliff](https://github.com/orhun/git-cliff) keep-a-changelog changelog generator and version bumper
  - [lychee](https://github.com/lycheeverse/lychee) link checker
  - [minijinja](https://github.com/mitsuhiko/minijinja) templating
  - [treefmt](https://github.com/numtide/treefmt) code formatting
  - [trivy](https://github.com/aquasecurity/trivy) and [trufflehog](https://github.com/trufflesecurity/trufflehog) security scanning 
  - [venom](https://github.com/ovh/venom) and [hurl](https://github.com/Orange-OpenSource/hurl) test suites
  - [rspress](https://github.com/web-infra-dev/rspress) and [mdbook](https://github.com/rust-lang/mdBook) documentation sites
  - abc and xyz todo list / kanban manager

## Install

```sh
cargo install just
just install
```

## Build

```sh
just build
```

## Dependencies
  - cocogitto
  - hurl
  - git-cliff
  - goji
  - go-task
  - just
  - lychee
  - lefthook
  - minijinja
  - pipelight
  - treefmt
  - trivy
  - trufflehog
  - typos
  - venom
