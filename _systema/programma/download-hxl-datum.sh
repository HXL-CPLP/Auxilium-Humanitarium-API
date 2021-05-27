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
Hapi_L10N="https://proxy.hxlstandard.org/data/download/L10n_hxl_csv.csv?dest=data_edit&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1181688279"


Hapi_commune="https://proxy.hxlstandard.org/data.csv?dest=data_edit&filter01=cut&filter-label01=Remove+%23meta&cut-exclude-tags01=%23meta&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D355011653"
# Hapi_commune_meta="https://proxy.hxlstandard.org/data.csv?dest=data_view&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D355011653"

Hapi_schemam="https://proxy.hxlstandard.org/data.csv?dest=data_edit&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%3Fpli%3D1%23gid%3D1345709789"

Hapi_api="https://proxy.hxlstandard.org/data.csv?dest=data_edit&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%3Fpli%3D1%23gid%3D1680147913"

ROOTDIR="$(pwd)"

#### DATA PULL _________________________________________________________________

# TODO: check first if remote resources are online (or if do exist network)
#       instead of save to disk. These " if true;" are placeholders

# TODO: check error codes if download fails

if true ; then
    echo "Hapi_L10N"
    echo "   Fontem: [$Hapi_L10N]"
    echo "   Filum:  [${ROOTDIR}/_data/L10n.hxl.csv]"
    wget -qO- "$Hapi_L10N" > "${ROOTDIR}/_data/L10n.hxl.csv"
fi
if true ; then
    echo "Hapi_commune"
    echo "   Fontem: [$Hapi_commune]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/commune.tm.hxl.csv"
    wget -qO- "$Hapi_commune" > "${ROOTDIR}/_data/tm/commune.tm.hxl.csv"
fi
# if true ; then
#     echo "Hapi_commune_meta"
#     echo "   Fontem: [$Hapi_commune_meta]"
#     echo "   Filum:  [${ROOTDIR}/_data/tm/commune.tm.hxl.csv"
#     wget -qO- "$Hapi_commune_meta" > "${ROOTDIR}/_data/tm/commune-meta.tm.hxl.csv"
# fi
if true ; then
    echo "Hapi_schemam"
    echo "   Fontem: [$Hapi_schemam]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/hapi-schemam.tm.hxl.csv"
    wget -qO- "$Hapi_schemam" > "${ROOTDIR}/_data/tm/hapi-schemam.tm.hxl.csv"
fi

if true ; then
    echo "Hapi_api"
    echo "   Fontem: [$Hapi_api]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/hapi-api.tm.hxl.csv"
    wget -qO- "$Hapi_api" > "${ROOTDIR}/_data/tm/hapi-api.tm.hxl.csv"
fi

exit 0
