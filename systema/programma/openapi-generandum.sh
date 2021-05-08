#!/bin/sh
#===============================================================================
#
#          FILE:  openapi-generandum.sh
#
#         USAGE:  ./systema/programma/openapi-generandum.sh
#
#   DESCRIPTION:  Trivia:
#                 - "OpenAPI"
#                   - https://www.openapis.org/
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
#       VERSION:  v0.5
#       CREATED:  2021-05-08 08:07 UTC v0.5 started
#      REVISION:  ---
#===============================================================================

# ROOTDIR="/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API"
# TODO: let configurable ROOTDIR later
# ROOTDIR="$(pwd)"


# api/BR/portais-ckan-brasil/por/openapi.yaml
openapi-generator-cli generate --generator-name html \
  --input-spec api/BR/portais-ckan-brasil/por/openapi.yaml \
  --output api/BR/portais-ckan-brasil/por/html

openapi-generator-cli generate --generator-name html2 \
  --input-spec api/BR/portais-ckan-brasil/por/openapi.yaml \
  --output api/BR/portais-ckan-brasil/por/html2
