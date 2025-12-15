function run-framework
  argparse --ignore-unknown 'cd=' -- $argv
  or return 1

  if [ -n "$_flag_cd" ]
    cd $_flag_cd
  end

  # Run run scripts
  for stage in preflight init setup run shutdown teardown clean completed
    run-framework-run-stage $stage

    if not [ $status -eq 0 ]
      colorme red "Error: Stage $stage failed. Exiting."
      return 1
    end
  end
end

function run-framework-get-run-cmd
  set file $argv
  set filename (basename $file)

  switch (string lower $filename)
    case Makefile.toml
      set build (git rev-parse --show-toplevel)/build
      set cmd "cp $build/Makefile.toml Makefile.runner ; cargo make --makefile $Makefile.runner.toml --verbose"

    case justfile
      set cmd "just --justfile $file --verbose"

    case taskfile.yaml
      set cmd "task --taskfile $file --verbose"

    case pipelight.yaml
      set path (dirname $file)
      set cmd "cd $path ; pipelight trigger --flag default --attach ; pipelight logs -vv"

    case dagu.yaml
      # TODO: loop `dagu status` until it's completed
      set cmd "dagu start $file"

    case venom.yaml
      mkdir venom
      cp venom.yaml venom
      set path (dirname $file)/venom
      set cmd "cd $path ; venom run --verbose"

    case run.hurl
      set cmd "hurl --verbose $file"

    case test.hurl
      set cmd "hurl --verbose --test $file"

    case '*'
      set cmd "./$file"

  end

  echo $cmd
end

function run-framework-run-prepost
  set tmp (mktemp)

  echo "
  run:
      git-init
      just
      $argv" > $tmp

  just -f $tmp
  rm $tmp
end

function run-framework-run-venom
  argparse 'stage=' -- $argv
  or return 1

  set stage $_flag_stage

  if [ -d "./run/scripts/$stage/venom" ]
    cd ./run/scripts/$stage/venom

    # Run venom scripts
    for file in (find | grep '.hurl$' )
      venom run $file
    end
  end
end

function run-framework-run-hurl
  argparse 'stage=' -- $argv
  or return 1

  set stage $_flag_stage

  if [ -d "./run/scripts/$stage/hurl" ]
    mkdir ./run/scripts/$stage/hurl
    cd ./run/scripts/$stage/hurl

    # Run hurl scripts
    for file in (find | grep '.hurl$' )
      hurl run $file
    end
  end
end

function run-framework-run-stage
  set stage $argv[1]

  mkdir ./run/scripts/$stage/{pre,post}

  # Run pre scripts
#    for f in ./run/scripts/$stage/pre
#      run-framework-run-prepost $f
#
#      if not [ $status -eq 0 ]
#        colorme red "Pre $stage :: $f failed. Exiting."
#        return 1
#      end
#    end

  if [ -d ./run/scripts/$stage/pre ]
    run-framework --cd ./run/scripts/$stage/pre

    if [ $status -eq 0 ]
      colorme red "Tests for pre $stage failed. Exiting."
      return 1
    end
  end

  for f in (find --type f ./run/scripts/$stage/pre)
    set cmd (run-framework-get-run-cmd $f)
    set -a pre_scripts run-framework-run-prepost $cmd
  end

  parallel -- $pre_scripts
  if not [ $status -eq 0 ]
    colorme red "Pre $stage failed. Exiting."
    return 1
  end

  set run_scripts (find --type executable ./run/scripts/$stage/run)
  if [ -n "$run_scripts" ]
    parallel -- $run_scripts
    if not [ $status -eq 0 ]
      colorme red "Run $stage failed. Exiting."
      return 1
    end

  else
    switch $stage
      # preflight
      case preflight
        colorme green "Empty preflight script."
        #cargo make preflight

      # init
      case init
        colorme green "Empty init script."
        #cargo make init

      # venom validation
      case setup
        run-framework-run-venom --stage $stage

      # hurl API
      case run
        if [ -d ./run/scripts/$stage/run ]
          run-framework --cd ./run/scripts/$stage/run

          if [ $status -eq 0 ]
            colorme red "Tests for post $stage failed. Exiting."
            return 1
          end
        end

        run --window mprocs --command="hurl: run-framework-run-hurl --stage $stage"

      # shutdown
      case shutdown
        colorme green "Empty shutdown script."
        #cargo make shutdown

      # teardown
      case teardown
        colorme green "Empty teardown script."
        #cargo make teardown

      # clean
      case clean
        colorme green "Empty clean up script."
        #cargo make clean

      # completed
      case completed
        colorme green "Empty completed script."
        #cargo make completed

      case "*"
        colorme red "Unsupported stage $stage"
        return 1
    end
  end

  # Run post scripts
#  for f in ./run/scripts/$stage/post
#    run-framework-run-prepost $f
#
#    if not [ $status -eq 0 ]
#      colorme red "Post $stage :: $f failed. Exiting."
#      return 1
#    end
#  end

  if [ -d ./run/scripts/$stage/post ]
    run-framework --cd ./run/scripts/$stage/post

    if [ $status -eq 0 ]
      colorme red "Tests for post $stage failed. Exiting."
      return 1
    end
  end

  for f in (find --type f ./run/scripts/$stage/post)
    set cmd (run-framework-get-run-cmd $f)
    set -a post_scripts run-framework-run-prepost $cmd
  end

  parallel -- $post_scripts
  if not [ $status -eq 0 ]
    colorme red "Post $stage failed. Exiting."
    return 1
  end
end
