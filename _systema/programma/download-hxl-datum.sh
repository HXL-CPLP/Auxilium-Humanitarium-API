#!/bin/sh
#===============================================================================
#
#          FILE:  download-hxl-datum.sh
#
#         USAGE:  ./_systema/programma/download-hxl-datum.sh
#
#   DESCRIPTION:  Download data from Google Spreadsheets via HXL-Proxy
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0
#       CREATED:  2021-05-13 20:16 UTC started, based on EticaAI/
#                         HXL-Data-Science-file-formats/prepare-hxlm-relsease.sh
#      REVISION: ---
#===============================================================================

# Trivia:
# - "download"
#   - Note: no idea what word use for 'download' not even in New Latin
#   - https://en.wiktionary.org/wiki/download
# - "hxl"
#   - https://hxlstandard.org/
# - "datum"
#   - https://en.wiktionary.org/wiki/datum#Latin

#### Customizations, ___________________________________________________________

### Data pull configurations ---------------------------------------------------

# @see https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279
HAPI_L10N="https://proxy.hxlstandard.org/data/download/L10n_hxl_csv.csv?dest=data_edit&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1181688279"

ROOTDIR="$(pwd)"

#### DATA PULL _________________________________________________________________

# TODO: check first if remote resources are online (or if do exist network)
#       instead of save to disk. These " if true;" are placeholders

# TODO: check error codes if download fails

if true ; then
    echo "HAPI_L10N"
    echo "   Fontem: [$HAPI_L10N]"
    echo "   Filum:  [${ROOTDIR}/_data/L10n.hxl.csv]"
    wget -qO- "$HAPI_L10N" > "${ROOTDIR}/_data/L10n.hxl.csv"
fi

exit 0
