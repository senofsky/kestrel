#!/bin/bash

# This script starts the Docker container and gives it a command to execute.
#
# If an argument is given to this script, the argument will be executed by the
# container. Otherwise, an interactive shell to the container is provided.

# The Docker container we are using:
# https://hub.docker.com/repository/docker/senofsky/kestrel
container="senofsky/kestrel"

# This function will print the given input to stderr for immediate printing.
print_to_stderr() {
    echo "$*" >&2
}

# This function will print the given input to stderr and force this script to
# exit with a non-zero exit status
die() {
    echo "$*" >&2
    exit 1
}

# This script's argument array will be the command passed to the container.
command=$@

# If no command is given, then create an interactive shell into the container.
[ $# -eq 0 ] && tty -s && command="/bin/bash"

# If the terminal is connected to stdin, set a flag that will connect the
# terminal to the container. This will provide a shell into the container.
tty -s && interactive_terminal=t

# Fetch the latest version of the container
print_to_stderr "Retrieving the latest container..."
docker pull $container || die "Failed to update docker container"

# Run the container with the same user and group ID as the current session.
user_id=$(id -u)
group_id=$(id -g)

# Start the container
print_to_stderr "Starting the container..."
exec docker run \
    --volume $PWD:/kestrel \
    -i$interactive_terminal \
    --workdir /kestrel \
    --rm -- \
    $container \
    $command
