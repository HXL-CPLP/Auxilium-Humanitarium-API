#!/bin/bash
#===============================================================================
#
#          FILE:  openapi-validum.sh
#
#         USAGE:  ./systema/programma/openapi-validum.sh
#
#   DESCRIPTION:  Trivia:
#                 - "OpenAPI"
#                   - https://www.openapis.org/
#                 - "validum"
#                   - https://en.wiktionary.org/wiki/validus#Latin
#                   - https://en.wiktionary.org/wiki/generator#English
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  - openapi-generator-cli
#                    - https://github.com/OpenAPITools/openapi-generator
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v0.5
#       CREATED:  2021-05-08 08:40 UTC v0.5 started
#      REVISION:  ---
#===============================================================================

# ROOTDIR="/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API"
# TODO: let configurable ROOTDIR later
# ROOTDIR="$(pwd)"


# # api/BR/portais-ckan-brasil/por/openapi.yaml
# openapi-generator-cli generate --generator-name html \
#   --input-spec api/BR/portais-ckan-brasil/por/openapi.yaml \
#   --output api/BR/portais-ckan-brasil/por/html

# openapi-generator-cli generate --generator-name html2 \
#   --input-spec api/BR/portais-ckan-brasil/por/openapi.yaml \
#   --output api/BR/portais-ckan-brasil/por/html2

OPENAPI_SPECS=(
  'api/BR/portais-ckan-brasil/por/openapi.yaml'
  'api/BR/brazilian-ckan-portals/eng/openapi.yaml'
)

# https://stackoverflow.com/questions/4332478/read-the-current-text-color-in-a-xterm/4332530#4332530
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# Trivia: 'errōrem', https://en.wiktionary.org/wiki/error#Latin
ERROREM=0

for oas_filum in "${OPENAPI_SPECS[@]}"
do
    # printf '\t\t%s%s%s%s\n\n' "$GREEN" "$BLINK" "$oas_filum" "$NORMAL"
    printf '\n%s%sopenapi-validum.sh: %s validum?  %s\n' \
        "$BRIGHT" "$CYAN" "$oas_filum" "$NORMAL"
    # echo ">>> $oas_filum\n\n\n"
    if ! openapi-generator-cli validate --input-spec "$oas_filum"; then
        printf '\n%s%sopenapi-validum.sh: %s validum?  %s\n' \
          "$BRIGHT" "$RED" "$oas_filum" "$NORMAL"
        # printf '\t\t%s%s%s%s\n\n' "$RED" "$BLINK" "$oas_filum" "$NORMAL"
        ERROREM=$($ERROREM + 1)
    fi
done

if [ "$ERROREM" != 0 ]; then
    echo "exiting with error"
    exit 1
else
    exit 0
fi

# openapi-generator-cli validate --input-spec api/BR/portais-ckan-brasil/por/openapi.yaml




# if [ $? -eq 0 ]
# then
#   echo "The script ran ok"
#   exit 0
# else
#   echo "The script failed" >&2
#   exit 1
# fi