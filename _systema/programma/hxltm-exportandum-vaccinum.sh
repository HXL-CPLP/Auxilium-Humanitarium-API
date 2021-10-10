#!/bin/sh
#===============================================================================
#
#          FILE:  hxltm-exportandum-vaccinum.sh
#
#         USAGE:  ./_systema/programma/hxltm-exportandum-vaccinum.sh
#      HXLTM_DOWNLOAD_FORCE=0 ./_systema/programma/hxltm-exportandum-vaccinum.sh
#      HXLTM_DOWNLOAD_FORCE=1 ./_systema/programma/hxltm-exportandum-vaccinum.sh
#
#   DESCRIPTION:  _[eng-Latn] Export HXL TMs to some more traditional
#                             localization formats.
#                             @see https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/issues/16
#                             @see https://github.com/HXL-CPLP/forum/issues/58
#                 [eng-Latn]_
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
#       CREATED:  2021-10-10 07:30 UTC started, based 
#                                      _systema/programma/hxltm-exportandum.sh
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

# @see https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1292720422

# x_api +eng_okapi_full +alt +xsv
hxltm_vaccinum="https://proxy.hxlstandard.org/data/download/schemam_tm_hxl.csv?dest=data_view&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1couRYFuVLnr6CfIMEiXKBamJtmcHinSAy1K1e69rNqw%2Fedit%23gid%3D141644151&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on"

ROOTDIR="$(pwd)"
_HXLTM_DOWNLOAD_FORCE="${HXLTM_DOWNLOAD_FORCE:-0}" 

#### DATA PULL _________________________________________________________________

if [ "$_HXLTM_DOWNLOAD_FORCE" -eq "1" ] ; then
    echo ''
    echo "hxltm_vaccinum"
    echo "   Fontem: [$hxltm_vaccinum]"
    echo "   Filum:  [${ROOTDIR}/_data/tm/vaccinum.tm.hxl.csv"
    echo "wget -qO- \"$hxltm_vaccinum\" > \"${ROOTDIR}/_data/tm/vaccinum.tm.hxl.csv\""
    wget -qO- "$hxltm_vaccinum" > "${ROOTDIR}/_data/tm/vaccinum.tm.hxl.csv"
else
    echo "[_eng-Latn] Download skipped."
    echo "            Use HXLTM_DOWNLOAD_FORCE=1 $0"
    echo "            To re-download again instead of use local saved file"
    echo "[eng-Latn_]"
fi

#### HXLTMCLI __________________________________________________________________

# wget -qO- "https://proxy.hxlstandard.org/data/download/schemam_tm_hxl.csv?dest=data_view&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1couRYFuVLnr6CfIMEiXKBamJtmcHinSAy1K1e69rNqw%2Fedit%23gid%3D141644151&filter01=cut&filter-label01=Non+%23meta&cut-exclude-tags01=%23meta&cut-skip-untagged01=on&filter02=select&filter-label02=%23status%3E-1&select-query02-01=%23status%3E-1&strip-headers=on&force=on" > "/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/_data/tm/vaccinum.tm.hxl.csv"
# hxltmcli https://docs.google.com/spreadsheets/d/1couRYFuVLnr6CfIMEiXKBamJtmcHinSAy1K1e69rNqw/edit#gid=141644151 --objectivum-TBX-Basim
hxltmcli _data/tm/vaccinum.tm.hxl.csv --objectivum-TBX-Basim > _hxltm/vaccinum.tm.hxl.tbx
hxltmcli _data/tm/vaccinum.tm.hxl.csv --objectivum-XML > _hxltm/vaccinum.tm.hxl.xml

echo ""
echo 'Okay!'
exit 0
