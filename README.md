# Generic Template

GitHub Actions, Woodpecker CI, and Lefthook pre-commit scripts.

## Features
  - GitHub Actions integration
  - [Woodpecker CI](https://woodpecker-ci.org) integration
  - [Lefthook](https://github.com/evilmartians/lefthook) pre-commit scripts
  - [just](https://just.systems) and [go-task](https://taskfile.dev) task runners
  - [pipelight](https://pipelight.dev) CI pipelines
  - [goji](https://github.com/muandane/goji) commitizen commit message linting
  - [typos](https://github.com/crate-ci/typos) spell checking
  - [git-cliff](https://github.com/orhun/git-cliff) keep-a-changelog changelog generator
  - [lychee](https://github.com/lycheeverse/lychee) dead link checker
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
  - hurl
  - git-cliff
  - goji
  - just
  - lychee
  - lefthook
  - minijinja
  - pipelight
  - task
  - treefmt
  - trivy
  - trufflehog
  - typos
  - venom
