build:
  comtrya -d comtrya -v apply
  pipelight trigger --flag pre-commit --attach
  pipelight logs -vv
  just test
  just clean

test:
  task test

lint:
  task lint

format:
  task format

audit:
  task audit

clean:
  task clean

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

# TODO:
#  - cocogitto
#  - hurl
#  - git-cliff
#  - goji
#  - lychee
#  - minijinja
#  - pipelight
#  - task
#  - treefmt
#  - trivy
#  - trufflehog
#  - typos
#  - venom

install:
  lefthook install

help:
  task help
