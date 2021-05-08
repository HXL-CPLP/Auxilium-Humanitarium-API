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
#  REQUIREMENTS:  - bash
#                    - Need support for one dimensional arrays
#                 - awk
#                    - To make one dimencional arrays in multidimencional
#                 - openapi-generator-cli
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
    'eng api/BR/brazilian-ckan-portals/eng'
    'por api/BR/portais-arcgis-brasil/por'
    'por api/BR/portais-ckan-brasil/por'
    'eng api/UN/CODV2API/eng'
    'eng api/UN/HDX/eng'
    'eng api/UN/reliefweb/eng'
    'eng api/XZ/HXL-Proxy/eng'
)

# Trivia: 'exportandum', https://en.wiktionary.org/wiki/exporto#Latin
OPENAPI_EXPORTANDUM=(
    'html'
    'html2'
    'mysql-schema'
    'graphql-schema'
)


# Git user ID, e.g. openapitools.
OPENAPI_GIT_USER_ID="HXL-CPLP"
# Git repo ID, e.g. openapi-generator.
OPENAPI_GIT_REPO_ID="Auxilium-Humanitarium-API"


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
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
# REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)

PATHSCRIPT=$(dirname "$(readlink -f "$0")")
TMPL="${PATHSCRIPT}/tmpl"

for oas_meta in "${OPENAPI_RADICEM[@]}"
do
    linguam_iso6393=$(echo "$oas_meta" | tr -s ' ' | cut -d " " -f 1)
    # echo "$linguam_iso6393"
    oas_radix=$(echo "$oas_meta" | tr -s ' ' | cut -d " " -f 2)
    # echo "$oas_radix"
    oas_filum="${oas_radix}/openapi.yaml"
  
    printf '\n%s%sopenapi-exportandum.sh: %s  %s\n' \
        "$BRIGHT" "$CYAN" "$oas_radix" "$NORMAL"

    ### For each openapi-generator-cli exporter
    for oas_exporto in "${OPENAPI_EXPORTANDUM[@]}"
    do
        oas_exporto_radix="${oas_radix}/${oas_exporto}"
        printf '\n%s%s  openapi-exportandum.sh: %s/%s  %s\n' \
            "$BRIGHT" "$CYAN" "$oas_radix" "$oas_exporto" "$NORMAL"

        if ! openapi-generator-cli generate --minimal-update \
              --git-user-id "${OPENAPI_GIT_USER_ID}" \
              --git-repo-id "${OPENAPI_GIT_REPO_ID}" \
              --generator-name "$oas_exporto" \
              --input-spec "$oas_filum" \
              --output "$oas_exporto_radix" ; then
  
            printf '\n%s%%s non validum!  %s\n' \
              "$BRIGHT" "$RED" "$oas_filum" "$NORMAL"
            ERROREM=$((ERROREM + 1))
        fi
    done

    ### Our custom index page per project per language
    printf '\n%s%sopenapi-exportandum.sh: %s/index.html custom index %s\n' \
        "$BRIGHT" "$MAGENTA" "$oas_radix" "$NORMAL"
    cp "${TMPL}/${linguam_iso6393}/index.html" "$oas_radix/index.html"
    # echo "${TMPL}/${linguam_iso6393}/index.html"
    # echo "$oas_radix/index.html"

done

if [ "$ERROREM" != 0 ]; then
    printf '\n%s%snon validum!  %s\n' \
      "$BRIGHT" "$RED" "$NORMAL"
    # echo "exiting with error"
    exit 1
else
    exit 0
fi