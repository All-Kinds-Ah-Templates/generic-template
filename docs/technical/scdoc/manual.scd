hello-world(1)

# NAME

example - A hello world example

# SYNOPSIS

*hello-world* [options...] [command]

# OPTIONS

*-h, --help*
	Show help message and quit.

*-c, --config* <config>
	Specifies a config file.

*-C, --validate*
	Check the validity of the config file, then exit.

*-d, --debug*
	Enables full logging, including debug information.

*-v, --version*
	Show the version number and quit.

*-V, --verbose*
	Enables more verbose logging.

# DESCRIPTION

hello-world is an example program.

You can run sway directly from the terminal.

# CONFIGURATION

sway searches for a config file in the following locations, in this order:

. ~/.hello-world/config.toml
. $XDG_CONFIG_HOME/hello-world/config.toml (suggested location)
. /etc/hello-world/config.toml

For information on the config file format, see *hello-world*(5).

# ENVIRONMENT

The following environment variables have an effect on sway:

_HELLO_WORLD_
	Specifies the name as a string.

# AUTHORS

Maintained by John Doe <john.doe@example.com>.
For more information about sway development, see
<https://example.com/hello-world>.

# SEE ALSO

*hello-world*(5) *hello-world*(1)
