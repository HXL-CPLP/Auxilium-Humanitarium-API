#!/bin/bash
#===============================================================================
#
#          FILE:  graphql-exportandum.sh
#
#         USAGE:  ./systema/programma/graphql-exportandum.sh
#
#   DESCRIPTION:  Trivia:
#                 - "OpenAPI"
#                   - https://www.openapis.org/
#                 - "exportandum"
#                   - https://en.wiktionary.org/wiki/exporto#Latin
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  
#                 - npm install -g @2fd/graphdoc
#                    - https://github.com/2fd/graphdoc
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v0.5
#       CREATED:  2021-05-08 15:10 UTC started, based on openapi-exportandum.sh
#      REVISION:  ---
#===============================================================================

# THE graphql-exportandum.sh IS AN DRAFT!

# graphdoc --schema-file schema/testum/testum.graphql --output systema/cache/testum-graphql-1/ --force
# graphdoc --schema-file api/UN/reliefweb/eng/graphql-schema/openapi2graphql/api/countries_api.graphql --output systema/cache/testum-reliefweb-countries_api/ --force
#    Error: ✗ Must provide schema definition with query type or a type named Query.

graphdoc --schema-file schema/iso/iso639-3/eng/iso639-3.graphql --output schema/iso/iso639-3/eng/graphql-doc --force


exit 0
