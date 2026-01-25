[doc('Run build')]
build:
  [ -d "setup" ] && comtrya -d setup -v apply || true
  pipelight trigger --flag pre-commit --attach
  pipelight logs -vv
  just test
  just clean

# Build documentation
docs:
  task docs
  #cargo doc --no-deps --open

# Run tests
test:
  task test

# Code coverage
coverage:
  task coverage

# Perform linting
lint:
  task lint

# Format files
format:
  task format

# Security audit
audit:
  task audit

# Doctor diagnostics
doctor:
  task doctor

# Run lints, formating, and tests
[parallel]
check: lint format test

# Fix build errors
fix:
  task fix

[private]
prepare-commit-msg file:
  #!/bin/sh
  if [ ! -f ".goji.json" ]; then
    goji init --repo
  fi
  RAWMSG=$(cat {{file}} | grep -v '^[ ]*#')
  echo "prepare raw :: $RAWMSG"
  goji --no-commit --message "$RAWMSG" > {{file}}

[private]
lint-commit-msg file:
  #!/bin/sh
  RAWMSG=$(cat {{file}} | grep -v '^[ ]*#')
  echo "lint raw :: $RAWMSG"
  MSG=$(goji check --from-file {{file}})
  CHECK=$(echo $MSG | grep '^Error' | wc -l)
  if [ "$CHECK" -gt 0 ]; then
    return 1
  fi

# Install and configure tools
setup:
  lefthook install
  prek install
  prek auto-upgrade
  mise trust --quiet .mise.toml
  @[ -f ".mise.local.toml" ] && mise trust --quiet .mise.local.toml || return 0
  mise install

# Build and install binary
install:
  task build
  echo "TODO: Move binary to ~/.local/bin or /usr/local/bin"

# Setup environement variables
env:
  echo "Setup environment variables..."

# Clean up
clean:
  task clean

  # Manage tasks using tiki or todo-tree
  # Manage tasks using tiki or todo-tree
todo arg='list':
    @{{ if arg =~ '^(add|edit|open|view)$' { "tiki " + arg } \
        else if arg == "list" { "todo-tree" } \
        else { "echo Unknown argument: " + arg + " && exit 1" } }}

# Prompt Copilot A.I.
ask *question:
  copilot -p '{{question}}' --allow-all-tools

# Help
help:
  task help

alias up := upgrade

# Upgrade tools
upgrade:
  echo "Updating installed software..."
  task upgrade

# Bump release version
bump +PART="patch":
  @if [ "{{PART}}" != "patch" ] && [ "{{PART}}" != "minor" ] && [ "{{PART}}" != "major" ]; then \
    echo "Error: PART must be one of: patch, minor, major"; \
    exit 1; \
  fi
  echo "Bump {{PART}} version..."
  yatr "bump-{{PART}}"

# Publish a release
release:
  echo "Publish release..."

# Deploy online
deploy:
  echo "Deploy online..."

# Start in dev mode
dev:
  echo "Starting in dev mode..."

# Watch for changes
watch:
  echo "Watching changes..."
  cargo watch -x test

# Performance benchmarking
bench:
  echo "Launch benchmarks..."

timed task:
  #!/usr/bin/env fish

  set start (date +%s)

  set cyan (set_color cyan)
  set green (set_color green)
  set yellow (set_color yellow)
  set red (set_color red)
  set reset (set_color normal)

  echo "▶ $cyan""{{task}}""$reset"

  just {{task}}
  set s $status

  set end (date +%s)
  set duration (math $end - $start)

  if test $s -eq 0
    echo "$green""✔""$reset   $yellow""⏱  took $duration""s""$reset"
  else
    echo "$red""✖""$reset   $yellow""⏱  took $duration""s""$reset"
  end

  exit $s
