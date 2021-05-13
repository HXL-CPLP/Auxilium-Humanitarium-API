#!/bin/sh
#===============================================================================
#
#          FILE:  travis-ci.sh
#
#         USAGE:  ./_systema/infrastructuram/travis-ci.sh
#
#   DESCRIPTION:  ---
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
#       CREATED:  2021-05-11 18:04 UTC started as temporarium.sh
#      REVISION:  2021-05-11 19:34 UTC started travis-ci.sh
#===============================================================================
# @see https://docs.travis-ci.com/user/deployment/script/



### Recommendations on how to avoid leaking secrets to build logs
# @see https://docs.travis-ci.com/user/best-practices-security#recommendations-on-how-to-avoid-leaking-secrets-to-build-logs
# Despite our best efforts, there are however many ways in which secure
# information can accidentally be exposed. These vary according to what tools
# you are using and what settings you have enabled. Some things to look out for are:
#    settings which duplicate commands to standard output, such as set -x or set -v in your bash scripts
#    displaying environment variables, by running env or printenv
#    printing secrets within the code, for example echo "$SECRET_KEY"
#    using tools that print secrets on error output, such as php -i
#    git commands like git fetch or git push may expose tokens or other secure environment variables
#    mistakes in string escaping
#    settings which increase command verbosity
#    testing tools or plugins that may expose secrets while operating
echo "HAPI_DEPLOY_KEY_TEST: [$HAPI_DEPLOY_KEY_TEST]"

TEST2="test1${HAPI_DEPLOY_KEY_TEST}test2"

echo "TEST2: [$TEST2]"

echo "hello from /_systema/infrastructuram/travis-ci.sh"
exit 0
