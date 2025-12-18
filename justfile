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

install:
  lefthook install
  prek install
  prek auto-upgrade

setup:
  echo "Begin setup..."

env:
  echo "Setup environment variables..."

clean:
  task clean

help:
  task help

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
