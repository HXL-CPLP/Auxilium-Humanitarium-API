#!/bin/bash
#===============================================================================
#
#          FILE:  openapi-exportandum.sh
#
#         USAGE:  ./systema/programma/openapi-exportandum.sh
#
#   DESCRIPTION:  Trivia:
#                 - "OpenAPI"
#                   - https://www.openapis.org/
#                 - "exportandum"
#                   - https://en.wiktionary.org/wiki/exporto#Latin
#                 - "generandum"
#                   - https://en.wiktionary.org/wiki/genero#Latin
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
#       VERSION:  v1.0
#       CREATED:  2021-05-08 08:07 UTC v0.5 started openapi-generandum.sh
#      REVISION:  2021-05-08 09:59 UTC v0.6 MVP! Now openapi-exportandum.sh
#===============================================================================

# ROOTDIR="/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API"
# TODO: let configurable ROOTDIR later
# ROOTDIR="$(pwd)"

#### CUSTOMIZATIONS, start _____________________________________________________
# Note: while is possible to search by filename, at this moment this script
#       requires manual edit to add new files. Eventually this could be
#       improved

# Trivia: 'radicem', https://en.wiktionary.org/wiki/radix#Latin
OPENAPI_RADICEM=(
    # 'api/BR/brazilian-ckan-portals/eng/openapi.yaml'
    'api/BR/brazilian-ckan-portals/eng'
    'api/BR/portais-arcgis-brasil/por'
    'api/BR/portais-ckan-brasil/por'
    'api/UN/CODV2API/eng'
    'api/UN/HDX/eng'
    'api/XZ/HXL-Proxy/eng'
)

# Trivia: 'exportandum', https://en.wiktionary.org/wiki/exporto#Latin
OPENAPI_EXPORTANDUM=(
    'html'
    'html2'
)

#### CUSTOMIZATIONS, end _______________________________________________________

# Trivia: 'errōrem', https://en.wiktionary.org/wiki/error#Latin
ERROREM=0

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
NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
# REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)

# api/BR/portais-ckan-brasil/por/openapi.yaml
# openapi-generator-cli generate --generator-name html \
#   --input-spec api/BR/portais-ckan-brasil/por/openapi.yaml \
#   --output api/BR/portais-ckan-brasil/por/html

# openapi-generator-cli generate --generator-name html2 \
#   --input-spec api/BR/portais-ckan-brasil/por/openapi.yaml \
#   --output api/BR/portais-ckan-brasil/por/html2

for oas_radix in "${OPENAPI_RADICEM[@]}"
do
    printf '\n%s%sopenapi-exportandum.sh: %s  %s\n' \
        "$BRIGHT" "$CYAN" "$oas_radix" "$NORMAL"
    oas_filum="${oas_radix}/openapi.yaml"
    for oas_exporto in "${OPENAPI_EXPORTANDUM[@]}"
    do
        oas_exporto_radix="${oas_radix}/${oas_exporto}"
        printf '\n%s%s  openapi-exportandum.sh: %s/%s  %s\n' \
            "$BRIGHT" "$CYAN" "$oas_radix" "$oas_exporto" "$NORMAL"

        # echo $oas_exporto_radix

        # # printf '\t\t%s%s%s%s\n\n' "$GREEN" "$BLINK" "$oas_filum" "$NORMAL"
        # printf '\n%s%sopenapi-validum.sh: %s validum?  %s\n' \
        #     "$BRIGHT" "$CYAN" "$oas_filum" "$NORMAL"
        # # echo ">>> $oas_filum\n\n\n"
        # if ! openapi-generator-cli validate --input-spec "$oas_filum"; then
        #     printf '\n%s%sopenapi-validum.sh: %s validum?  %s\n' \
        #       "$BRIGHT" "$RED" "$oas_filum" "$NORMAL"
        #     # printf '\t\t%s%s%s%s\n\n' "$RED" "$BLINK" "$oas_filum" "$NORMAL"
        #     ERROREM=$((ERROREM + 1))
        # fi
        if ! openapi-generator-cli generate \
              --generator-name "$oas_exporto" \
              --input-spec "$oas_filum" \
              --output "$oas_exporto_radix" ; then
  
            printf '\n%s%%s non validum!  %s\n' \
              "$BRIGHT" "$RED" "$oas_filum" "$NORMAL"
            ERROREM=$((ERROREM + 1))
        fi
    done


    # # printf '\t\t%s%s%s%s\n\n' "$GREEN" "$BLINK" "$oas_filum" "$NORMAL"
    # printf '\n%s%sopenapi-validum.sh: %s validum?  %s\n' \
    #     "$BRIGHT" "$CYAN" "$oas_filum" "$NORMAL"
    # # echo ">>> $oas_filum\n\n\n"
    # if ! openapi-generator-cli validate --input-spec "$oas_filum"; then
    #     printf '\n%s%sopenapi-validum.sh: %s validum?  %s\n' \
    #       "$BRIGHT" "$RED" "$oas_filum" "$NORMAL"
    #     # printf '\t\t%s%s%s%s\n\n' "$RED" "$BLINK" "$oas_filum" "$NORMAL"
    #     ERROREM=$((ERROREM + 1))
    # fi
done

if [ "$ERROREM" != 0 ]; then
    printf '\n%s%snon validum!  %s\n' \
      "$BRIGHT" "$RED" "$NORMAL"
    # echo "exiting with error"
    exit 1
else
    exit 0
fi