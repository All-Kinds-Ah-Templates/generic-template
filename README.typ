# Generic Template
![Linting workflow](https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/lint.yaml/badge.svg)
![testing workflow](https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/test.yaml/badge.svg)
![packaging](https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/release-packaging.yaml/badge.svg)
![coverage](https://github.com/yonasBSD/rust-ci-github-actions-workflow/actions/workflows/coverage.yaml/badge.svg)
<!--[![codecov](https://codecov.io/gh/yonasBSD/rust-ci-github-actions-workflow/branch/main/graph/badge.svg?token=SLIHSUWHT2)](https://codecov.io/gh/yonasBSD/rust-ci-github-actions-workflow)-->
<!--[![ghcr.io](https://img.shields.io/badge/ghcr.io-download-blue)](https://github.com/yonasBSD/rust-ci-github-actions-workflow/pkgs/container/rust-ci-github-actions-workflow)-->
<!--[![Docker Pulls](https://img.shields.io/docker/pulls/rust-ci-github-actions-workflow/example.svg)](https://hub.docker.com/r/rust-ci-github-actions-workflow/example)-->
<!--[![Quay.io](https://img.shields.io/badge/Quay.io-download-blue)](https://quay.io/repository/rust-ci-github-actions-workflow/example)-->

![GitHub last commit](https://img.shields.io/github/last-commit/yonasBSD/rust-ci-github-actions-workflow)
[![Dependency Status](https://deps.rs/repo/github/yonasBSD/rust-ci-github-actions-workflow/status.svg)](https://deps.rs/repo/github/yonasBSD/rust-ci-github-actions-workflow)
[![GitHub Release](https://img.shields.io/github/release/yonasBSD/rust-ci-github-actions-workflow.svg)](https://github.com/yonasBSD/rust-ci-github-actions-workflow/releases/latest)
[![License](https://img.shields.io/github/license/yonasBSD/rust-ci-github-actions-workflow.svg)](https://github.com/yonasBSD/rust-ci-github-actions-workflow/blob/main/LICENSE.txt)
[![Matrix Chat](https://img.shields.io/matrix/vaultwarden:matrix.org.svg?logo=matrix)](https://matrix.to/#/#vaultwarden:matrix.org)


A generic template to base your language-specific templates.

## Features
  - [GitHub Actions](https://github.com/features/actions) integration
  - [Woodpecker CI](https://woodpecker-ci.org) integration
  - [lefthook](https://github.com/evilmartians/lefthook) pre-commit scripts
  - [just](https://just.systems) and [go-task](https://taskfile.dev) task runners
  - [comtrya](https://github.com/comtrya/comtrya) deployment runners
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
  - comtrya
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
  - typst
  - typos
  - venom
