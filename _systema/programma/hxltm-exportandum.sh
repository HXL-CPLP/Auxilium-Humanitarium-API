#!/bin/sh
#===============================================================================
#
#          FILE:  hxltm-exportandum.sh
#
#         USAGE:  ./_systema/programma/hxltm-exportandum.sh
#
#   DESCRIPTION:  _[eng-Latn] Export HXL TMs to some more traditional
#                             localization formats.
#                             @see https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/issues/16
#                             @see https://github.com/HXL-CPLP/forum/issues/58
#                             To manually test, via cli
#                                 sh /opt/okapi/tikal.sh --info
#                             To manually test, via gui
#                                 sh /opt/okapi/rainbow.sh
#                             To get started with Okapi:
#                                 https://okapiframework.org/wiki/index.php/Getting_Started
#
#                            To convert from CSV to XLiff, we need an output:
#                            (from https://okapiframework.org/wiki/index.php/Table_Filter)
#                                 Source — the column contains text in a source language.
#                                   30 Portuguese
#                                   33 English
#                                 Source ID — the column provides a unique ID for a source column. This ID becomes the name of the created text unit resource.
#                                   1
#                                 Target — the column contains text in target language for a given source column.
#                                   30 Portuguese
#                                   45 #item+i_sl+i_slv+is_latn, Slovenščina (Latinska abeceda)
#                                 Comment — the column contains a comment for a specified source column.
#                                   32 Portuguese
#                                   35 English
#                                 Record ID — the column provides an ID for the current record (row).
#                 [eng-Latn]_
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  - ./_systema/infrastructuram/okapi-install-locally.sh
#                   - okapi
#                     - java
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0
#       CREATED:  2021-06-26 21:44 UTC started, based 
#                                      _systema/programma/download-hxl-datum.sh
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
# - "HXL JSON Spec"
#   - https://proxy.hxlstandard.org/api/from-spec.html
#   - https://github.com/HXLStandard/hxl-proxy/wiki/JSON-processing-specs
# - "Okapi Framework"
#   - https://okapiframework.org/
#   - https://okapiframework.org/wiki/index.php/Getting_Started
#   - https://okapiframework.org/wiki/index.php?title=Main_Page
#   - https://okapiframework.org/wiki/index.php/Table_Filter

#### Customizations, ___________________________________________________________

### Data pull configurations ---------------------------------------------------

# @see https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1292720422

# x_api +eng_okapi_full +alt +xsv
Hapi_schemam_un_htcds="https://proxy.hxlstandard.org/data/download/schemam-un-htcds_tm_hxl.csv?dest=data_edit&filter01=select&filter-label01=%23status%3E-1&select-query01-01=%23status%3E-1&strip-headers=on&force=on&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1292720422"

ROOTDIR="$(pwd)"


#### Okapi checks ______________________________________________________________

if [ ! -f "/opt/okapi/tikal.sh" ]; then
    echo "Okapi already NOT installed?"
    echo "    sh /opt/okapi/tikal.sh --info"
    echo "    ./_systema/infrastructuram/okapi-install-locally.sh"
    echo "Aborting"
    exit 1
fi

#### DATA PULL _________________________________________________________________

if true ; then
    echo "Hapi_schemam_un_htcds"
    echo "   Fontem: [$Hapi_schemam_un_htcds]"
    echo "   Filum:  [${ROOTDIR}/_hxltm/schemam-un-htcds.tm.hxl.csv"
    wget -qO- "$Hapi_schemam_un_htcds" > "${ROOTDIR}/_hxltm/schemam-un-htcds.tm.hxl.csv"
fi


exit 0
