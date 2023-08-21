#!/bin/bash
# Copyright (c) Microsoft Corporation.

CLIDIR="$(dirname "$0")"/cli

source "${CLIDIR}"/vars.sh

source "${CLIDIR}"/help-functions.sh
source "${CLIDIR}"/helper-functions.sh
source "${CLIDIR}"/dependencies-functions.sh

source "${CLIDIR}"/cluster-functions.sh

source "${CLIDIR}"/cli-functions.sh

## main()
##
##   The entry point for this script.
##
main() {

  maybe_process_help "$@"

  mkdir -p "${FARMVIBES_AI_STORAGE_PATH}"
  check_required_tools
  patch_curl
  minikube_search_and_destroy 
  route_command "$@"
}

main "$@"
