build:
  comtrya -d setup -v apply
  pipelight trigger --flag pre-commit --attach
  pipelight logs -vv
  just test
  just clean

docs:
  task docs
  #cargo doc --no-deps --open

test:
  task test

coverage:
  task coverage

lint:
  task lint

format:
  task format

audit:
  task audit

@doctor:
  echo "\n\n=== Just Doctor ===\n\n"
  just -l
  echo "\n\n=== Taskfile Doctor ===\n\n"
  task -l
  echo "\n\n=== Mise Doctor ===\n\n"
  mise tasks
  mise list
  mise doctor
  echo "\n\n=== Pipelight Doctor ===\n\n"
  pipelight ls
  echo "\n\n=== Lefthook Doctor ===\n\n"
  lefthook validate
  echo "\n\n=== Prek Doctor ===\n\n"
  prek list
  echo "\n\n=== Comtrya Doctor ===\n\n"
  comtrya -d manifests status
  echo "\n\n=== Goji Doctor ===\n\n"
  goji check
  COUNT=$(cat .goji.json | jq '.types | length') ; echo "\n\nFound $COUNT goji types."

[parallel]
check: lint format test

fix:
  task fix

prepare-commit-msg file:
  #!/bin/sh
  if [ ! -f ".goji.json" ]; then
    goji init --repo
  fi
  RAWMSG=$(cat {{file}} | grep -v '^[ ]*#')
  echo "prepare raw :: $RAWMSG"
  goji --no-commit --message "$RAWMSG" > {{file}}

lint-commit-msg file:
  #!/bin/sh
  RAWMSG=$(cat {{file}} | grep -v '^[ ]*#')
  echo "lint raw :: $RAWMSG"
  MSG=$(goji check --from-file {{file}})
  CHECK=$(echo $MSG | grep '^Error' | wc -l)
  if [ "$CHECK" -gt 0 ]; then
    return 1
  fi

setup:
  lefthook install
  prek install
  prek auto-upgrade
  mise trust --quiet .mise.toml
  @[ -f ".mise.local.toml" ] && mise trust --quiet .mise.local.toml || return 0
  mise install

install:
  task build
  echo "TODO: Move binary to ~/.local/bin or /usr/local/bin"

env:
  echo "Setup environment variables..."

clean:
  task clean

ask *question:
  copilot -p '{{question}}' --allow-all-tools

help:
  task help

alias up := upgrade

upgrade:
  echo "Updating installed software..."
  task upgrade

bump:
  echo "Bump release..."

release:
  echo "Publish release..."

deploy:
  echo "Deploy online..."

dev:
  echo "Starting in dev mode..."

watch:
  echo "Watching changes..."
  cargo watch -x test

bench:
  echo "Launch benchmarks..."
