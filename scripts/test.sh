#!/bin/bash

###
# Creates a temporary PostgreSQL container and runs tests.
###

function read_env_file {
  set -a
  [ -f .env.test ] && source .env.test
  set +a
}

##
# Main function
##
function main {
  # Read test env file
  read_env_file

  # Run tests.
  jest --runInBand
}

# And so, it begins...
main
