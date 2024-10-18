# Generic Template

GitHub Actions, Woodpecker CI, and Lefthook pre-commit scripts.

## Features
  - GitHub Actions integration
  - Woodpecker CI integration
  - Lefthook pre-commit scripts
  - just and go-task task runners
  - pipelight CI pipelines
  - goji commitizen commit message linting
  - git-cliff keep-a-changelog changelog generator
  - lychee dead link checker
  - minijinja templating
  - treefmt code formatting
  - trivy and trufflehog security scanning 
  - venom and hurl test suites
  - rspress and mdbook documentation sites
  - abc and xyz todo list / kanban manager

## Install
  - install just: `cargo install --git https://github.com/casey/just@latest`
  - run `just install`

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
  - venom
