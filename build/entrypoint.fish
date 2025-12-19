#!/usr/bin/fish

# If the user passed a command, run it instead of the framework
if test (count $argv) -gt 0
    exec $argv
end

# Otherwise run your default script
exec fish /app/run-framework.fish
