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
# Hapi_L10N="https://proxy.hxlstandard.org/data/download/L10n_hxl_csv.csv?dest=data_edit&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1181688279"
Hapi_miniman="https://proxy.hxlstandard.org/data/download/hapi-miniman_tm_hxl.csv?dest=data_edit&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%3Fpli%3D1%23gid%3D816634241"


Hapi_commune="https://proxy.hxlstandard.org/data/download/commune_tm_hxl.csv?dest=data_edit&filter01=cut&filter-label01=Remove+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D355011653"
# Hapi_commune_meta="https://proxy.hxlstandard.org/data.csv?dest=data_view&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D355011653"

Hapi_schemam="https://proxy.hxlstandard.org/data/download/schemam_tm_hxl.csv?dest=data_edit&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%3Fpli%3D1%23gid%3D1345709789"
Hapi_schemam_un_htcds="https://proxy.hxlstandard.org/data/download/schemam-un-htcds_tm_hxl.csv?dest=data_edit&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1292720422"

Hapi_api="https://proxy.hxlstandard.org/data/download/hapi-api_tm_hxl.csv?dest=data_edit&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%3Fpli%3D1%23gid%3D1680147913"
hxltm_specificationem="https://proxy.hxlstandard.org/data/download/hxltm-specificationem_hxl.csv?dest=data_edit&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1864477588"

hxltm_vaccinum="https://proxy.hxlstandard.org/data/download/schemam_tm_hxl.csv?dest=data_view&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1couRYFuVLnr6CfIMEiXKBamJtmcHinSAy1K1e69rNqw%2Fedit%23gid%3D141644151&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on"

ROOTDIR="$(pwd)"

#### DATA PULL _________________________________________________________________

# TODO: check first if remote resources are online (or if do exist network)
#       instead of save to disk. These " if true;" are placeholders

# TODO: check error codes if download fails

# if true ; then
#     echo "Hapi_L10N"
#     echo "   Fontem: [$Hapi_L10N]"
#     echo "   Filum:  [${ROOTDIR}/_data/L10n.hxl.csv]"
#     wget -qO- "$Hapi_L10N" > "${ROOTDIR}/_data/L10n.hxl.csv"
# fi

if true ; then
    echo ''
    echo "Hapi_miniman"
    echo "   Fontem: [$Hapi_miniman]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/hapi-miniman.tm.hxl.csv]"
    wget -qO- "$Hapi_miniman" > "${ROOTDIR}/_data/tm/hapi-miniman.tm.hxl.csv"
fi

if true ; then
    echo ''
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
    echo ''
    echo "Hapi_schemam"
    echo "   Fontem: [$Hapi_schemam]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/hapi-schemam.tm.hxl.csv"
    wget -qO- "$Hapi_schemam" > "${ROOTDIR}/_data/tm/schemam.tm.hxl.csv"
fi

if true ; then
    echo ''
    echo "Hapi_schemam_un_htcds"
    echo "   Fontem: [$Hapi_schemam_un_htcds]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/schemam-un-htcds.tm.hxl.csv"
    wget -qO- "$Hapi_schemam_un_htcds" > "${ROOTDIR}/_data/tm/schemam-un-htcds.tm.hxl.csv"
fi

if true ; then
    echo ''
    echo "Hapi_api"
    echo "   Fontem: [$Hapi_api]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/hapi-api.tm.hxl.csv"
    wget -qO- "$Hapi_api" > "${ROOTDIR}/_data/tm/hapi-api.tm.hxl.csv"
fi
if true ; then
    echo ''
    echo "Hapi_api"
    echo "   Fontem: [$hxltm_vaccinum]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/vaccinum.tm.hxl.csv"
    echo "wget -qO- \"$hxltm_vaccinum\" > \"${ROOTDIR}/_data/tm/vaccinum.tm.hxl.csv\""
    wget -qO- "$hxltm_vaccinum" > "${ROOTDIR}/_data/tm/vaccinum.tm.hxl.csv"
fi

if true ; then
    echo ''
    echo "hxltm_specificationem"
    echo "   Fontem: [$hxltm_specificationem]"
    # echo "   Filum:  [${ROOTDIR}/_data/tm/specificationem/hxltm-specificationem.hxl.csv"
    # echo "   Filum:  [${ROOTDIR}/_data/hxltm-specificationem.hxl.csv"
    echo "   Filum:  [${ROOTDIR}/_hxltm/hxltm-specificationem.hxl.csv"
    # wget -qO- "$hxltm_specificationem" > "${ROOTDIR}/_data/tm/specificationem/hxltm-specificationem.hxl.csv"
    # wget -qO- "$hxltm_specificationem" > "${ROOTDIR}/_data/hxltm-specificationem.hxl.csv"
    echo ''
    echo "Note: this file is not downloaded automatically (it's a spec, not translations). Execute this to download:"
    # wget -qO- "$hxltm_specificationem" > "${ROOTDIR}/_hxltm/hxltm-specificationem.hxl.csv"
    echo "wget -qO- \"$hxltm_specificationem\" > \"${ROOTDIR}/_hxltm/hxltm-specificationem.hxl.csv\""
    echo ''
fi

exit 0
