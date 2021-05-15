#!/bin/sh
#===============================================================================
#
#          FILE:  github-actions-locally.sh
#
#         USAGE:  ./_systema/infrastructuram/github-actions-locally.sh
#
#   DESCRIPTION:  ---
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  - docker
#                 - act (https://github.com/nektos/act)
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0
#       CREATED:  2021-05-15 19:08 UTC started as github-actions-locally.sh
#      REVISION:  2021-05-11 19:34 UTC started github-actions-locally.sh
#===============================================================================
# @see https://docs.travis-ci.com/user/deployment/script/

echo "> Read-me, not execute-me"
echo "> cat github-actions-locally.sh"
echo "> exiting ..."
exit 0


#### Install act _______________________________________________________________
echo "Docker install"
xdg-open https://docs.docker.com/engine/install/


#### Install nektos/act ________________________________________________________
echo "Docker install"
xdg-open https://github.com/nektos/act

#### Tests _____________________________________________________________________
docker --version
act --version

act -l

## Good response (repository that already have github actions)
# fititnt@bravo:/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API$ act -l
# ID     Stage  Name   
# build  0      Build  

## Bad response example (trying to use act on not ready repository)
# fititnt@bravo:/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API$ cd /tmp
# fititnt@bravo:/tmp$ act -l
# Error: stat /tmp/.github/workflows: no such file or directory


#### Running act (simulate GitHub actions locally) _____________________________
# Note: depending of how docker was configured, act will require sudo
#       because docker requires sudo.

### simple usage (without publish to github pages) -----------------------------

act
# sudo act

## Extra commands for debug and delete all images
## (DO NOT use these if you use docker for anything else)
# List all containers (include stopped)
#    sudo docker ps -a
# Show all local images
#    sudo docker image ls
# Stop running conteiners
#    sudo docker stop $(sudo docker ps -a -q)
# Delete all stoppend conteiners
#    sudo docker rm $(sudo docker ps -a -q)

### Publishing to github pages -------------------------------------------------
# When running github actions that do not only test code, but publish to remote
# servers, it may be requried some secrets.

# act --secret secrets.ACTIONS_DEPLOY_KEY="..."
# # sudo act --secret secrets.ACTIONS_DEPLOY_KEY="..."
# act --secret secrets-file="$HOME/.ssh/eticaai/.hapi.env"
# sudo act --secret secrets-file="$HOME/.ssh/eticaai/.hapi.env"

# Note: the first run, even with secrets files, did not published to GitHub.
#       but all steps before worked.

### Use one of these
act --secret secrets-file="$HOME/.ssh/eticaai/.hapi.env"
act --secret GH_TOKEN="EticaAIbotGHPersonalTokenHere"
