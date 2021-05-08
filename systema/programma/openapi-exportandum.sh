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
    'eng api/XZ/HXL-Proxy/eng'
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

# Split
# Author: https://stackoverflow.com/questions/918886
#         /how-do-i-split-a-string-on-a-delimiter-in-bash/44153302#44153302
split() {
    local string="$1"
    local delimiter="$2"
    if [ -n "$string" ]; then
        local part
        while read -r -d "$delimiter" part; do
            echo "$part"
        done <<< "$string"
        echo "$part"
    fi
}

for oas_meta in "${OPENAPI_RADICEM[@]}"
do
    linguam_iso6393=$(echo "$oas_meta" | tr -s ' ' | cut -d " " -f 1)
    # echo "$linguam_iso6393"
    oas_radix=$(echo "$oas_meta" | tr -s ' ' | cut -d " " -f 2)
    # echo "$oas_radix"
    oas_filum="${oas_radix}/openapi.yaml"
  
    printf '\n%s%sopenapi-exportandum.sh: %s  %s\n' \
        "$BRIGHT" "$CYAN" "$oas_radix" "$NORMAL"

    # https://stackoverflow.com/questions/918886
    # /how-do-i-split-a-string-on-a-delimiter-in-bash
    # oas_meta_split="(${oas_meta//;/ })"
    # IFS='|'; oas_meta_split=("$oas_meta"); unset IFS;
    # oas_meta='api/BR/brazilian-ckan-portals/eng eng'
    # A=$(echo "$oas_meta" | awk -F: "{print $1}")
    # B=$(echo "$oas_meta" | awk -F: "{print $2}")
    # B=$(echo one_two_three_four_five | awk -F_ '{print $2}')  
    # C=$(echo one_two_three_four_five | awk -F_ '{print $3}') 
    # $(echo "$oas_meta" | cut -f1 | read str1)
    # $(echo "$oas_meta" | cut -f2 | read str2)
    # echo $str1
    # echo $str2
    # echo $C
    # echo $D

    # var1=$(echo "bla@some.com;john@home.com" | cut -d ";" -f 1)
    # echo "$var1"

    # echo 'ooi'

    # string='one_two_three_four_five'
    # IFS='_' read -r a second a fourth a <<<"$string"
    # echo "$second $fourth"

    # string='oas_meta'
    # IFS='|' read -r a second a fourth a <<<"$oas_meta"
    # echo "$a $second"

    # # arr=(`echo $IN | tr ';' ' '`)
    # IN="bla@some.com;john@home.com"
    # IN="bla@some.com;john@home.com"
    # read -r ADDR1 ADDR2 <<<$(IFS=';'; echo $IN)
    # # read -r ADDR1 ADDR2 <<<$(IFS='|'; echo $oas_meta)
    # echo $oas_meta
    # echo $ADDR1
    # echo $ADDR2
    # echo "fin"
    # exit 1

    # oas_radix="${oas_meta_split[0]}"

    # For each exporter
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

    # Create new index file
    # echo 


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