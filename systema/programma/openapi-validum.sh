#!/bin/bash
#===============================================================================
#
#          FILE:  openapi-validum.sh
#
#         USAGE:  ./systema/programma/openapi-validum.sh
#
#   DESCRIPTION:  Do valitation of openapi.yaml files. Useful to find
#                 errors before trying to export to new formats.
#
#                 Trivia:
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

#### CUSTOMIZATIONS, start _____________________________________________________
# Note: while is possible to search by filename, at this moment this script
#       requires manual edit to add new files. Eventually this could be
#       improved

OPENAPI_SPECS=(
  'api/BR/brazilian-ckan-portals/eng/openapi.yaml'
  'api/BR/portais-arcgis-brasil/por/openapi.yaml'
  'api/BR/portais-ckan-brasil/por/openapi.yaml'
  'api/UN/CODV2API/eng/openapi.yaml'
  'api/UN/HDX/eng/openapi.yaml'
  'api/XZ/HXL-Proxy/eng/openapi.yaml'
  'api/UN/reliefweb/openapi.yaml'
)

#### CUSTOMIZATIONS, end _______________________________________________________


# @see https://stackoverflow.com/questions/4332478
#      /read-the-current-text-color-in-a-xterm/4332530#4332530
# BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
# LIME_YELLOW=$(tput setaf 190)
# POWDER_BLUE=$(tput setaf 153)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
# NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
# REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)

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
        ERROREM=$((ERROREM + 1))
    fi
done

if [ "$ERROREM" != 0 ]; then
    # echo "exiting with error"
    exit 1
else
    exit 0
fi
