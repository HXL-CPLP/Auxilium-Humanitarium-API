#!/bin/sh
#===============================================================================
#
#          FILE:  prepare-hapi-pages.sh
#
#         USAGE:  ./prepare-hapi-pages.sh
#
#   DESCRIPTION:  ./systema/programma/displicandum-gh-pages.sh
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
#       VERSION:  v0.2
#       CREATED:  2021-05-02 06:10 UTC started
#      REVISION:  2021-05-07 09:22 UTC renamed to displicandum-gh-pages.sh
#===============================================================================

# TODO: https://docs.travis-ci.com/user/deployment/pages/

#### openapi-generator (setup) _________________________________________________
# @see https://openapi-generator.tech/docs/installation
# npm install @openapitools/openapi-generator-cli -g
# openapi-generator-cli version
    # Download 5.1.0 ...
    # Downloaded 5.1.0
    # Did set selected version to 5.1.0
    # 5.1.0

# Online
#    http://api.openapi-generator.tech/index.html

#### Other comments (ignore) ___________________________________________________
### opendocumenter broken, giving up for now
# https://github.com/ouropencode/OpenDocumenter
# npm install -g opendocumenter

# https://openapi-generator.tech/docs/generators/html/

#### main ______________________________________________________________________
ROOTDIR="/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API"
# TODO: let configurable ROOTDIR later
#     ROOTDIR="$(pwd)"

LOCALGIT="${ROOTDIR}/systema/cache/gh-pages-temp-git"
DESTDIR="${LOCALGIT}/docs"
LOCALBUILD="${LOCALGIT}/build"

DEPLOY_REPO="git@github.com:HXL-CPLP/hapi.etica.ai.git"
DEPLOY_REMOTE_NAME="remote-publisher"
DEPLOY_BRANCH="gh-pages"
DEPLOY_CNAME="hapi.etica.ai"
DEPLOY_DATETIME="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

COMMIT_MESSAGE="Displicandum gh-pages [${DEPLOY_DATETIME}]: HXL-CPLP/Auxilium-Humanitarium-API"

# @see https://stackoverflow.com/questions/3696938
#      /how-do-you-commit-code-as-a-different-user
# https://github.com/eticaaibot
DEPLOY_AUTHOR="EticaAI Bot <etica.of.a.ai@gmail.com>"
GIT_COMMITTER_NAME="EticaAI Bot"
GIT_COMMITTER_EMAIL="etica.of.a.ai@gmail.com"

# DEPLOY_RESET="1"
DEPLOY_RESET=""


cd "${ROOTDIR}" || exit

# if [ ! -d "cache/" ]; then
#     # /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/cache/
#     mkdir "cache"
# fi

init_local_repo(){
    echo "creating ${LOCALGIT}"
    mkdir "${LOCALGIT}"
    echo "creating ${LOCALBUILD}"
    mkdir "${LOCALBUILD}"
    echo "creating ${DESTDIR}"
    mkdir "${DESTDIR}"

    # https://stackoverflow.com/questions/42871542
    cd "$LOCALGIT" || exit
    git init
    git checkout -b "${DEPLOY_BRANCH}"
    git remote add "${DEPLOY_REMOTE_NAME}" "${DEPLOY_REPO}"
    mkdir "${DESTDIR}"
    echo "> git branch ?"
    git branch
    cd "${ROOTDIR}" || exit
}


# jekyll help build
# @see https://jekyllrb.com/docs/usage/
jekyll_local_build(){
    jekyll build --source "${LOCALBUILD}" --destination "${DESTDIR}"
    touch "${DESTDIR}/.nojekyll"
}

if [ -d "${LOCALGIT}" ]; then
    # /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/cache/
    # mv "cache/gh-pages-temp-git" "cache/gh-pages-temp-git.OLD"
    if [ "${DEPLOY_RESET}" != "1" ]; then
        echo "${LOCALGIT} exists, but no DEPLOY_RESET"
    else
        echo "cleaning ${LOCALGIT}"
        rm -r "${LOCALGIT}"

        init_local_repo
    fi
else
    init_local_repo
fi

# echo "git status ${LOCALGIT}"
# git status "${LOCALGIT}"
# cd /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/systema/cache/gh-pages-temp-git && git status
# mkdir "cache/gh-pages-temp-git"

# git init cache/gh-pages-temp-git/
# mkdir cache/gh-pages-temp-git/docs/

# We don't need to use rsync --delete because the entire repository is deleted
# on each build. Also, we could use operatinal system /tmp to not waste sooner
# local disk (this may be relevant if number of files become huge)
rsync -av --exclude=".*" "${ROOTDIR}/api/" "${LOCALBUILD}/api/"
rsync -av --exclude=".*" "${ROOTDIR}/schema/" "${LOCALBUILD}/schema/"

## TODO: make this group less verbose
# rsync -av --exclude=".*" "${ROOTDIR}/*.md" "${LOCALBUILD}/"
rsync -av --exclude=".*" "${ROOTDIR}/por.md" "${LOCALBUILD}/por.md"
rsync -av --exclude=".*" "${ROOTDIR}/eng.md" "${LOCALBUILD}/eng.md"
rsync -av --exclude=".*" "${ROOTDIR}/README.md" "${LOCALBUILD}/README.md"
rsync -av --exclude=".*" "${ROOTDIR}/README-old.md" "${LOCALBUILD}/README-old.md"

rsync -av --exclude=".*" "${ROOTDIR}/_config.yml" "${LOCALBUILD}/_config.yml"
# rsync -av --exclude=".*" "${ROOTDIR}/CNAME" "${LOCALBUILD}/CNAME"
# echo "${DEPLOY_CNAME}" > "${LOCALBUILD}/CNAME"
echo "build/" > "${LOCALGIT}/.gitignore"
rsync -av --exclude=".*" "${ROOTDIR}/UNLICENSE" "${LOCALBUILD}/UNLICENSE"

jekyll_local_build

# TODO: DESTDIR or LOCALGIT for CNAME? Needs to check later.
echo "${DEPLOY_CNAME}" > "${DESTDIR}/CNAME"
echo "${DEPLOY_CNAME}" > "${LOCALGIT}/CNAME"
echo "PULL REQUESTS HERE https://github.com/HXL-CPLP/Auxilium-Humanitarium-API" > "${LOCALGIT}/README.md"

cd ${LOCALGIT} || exit

git add .

GIT_COMMITTER_NAME="${GIT_COMMITTER_NAME}" \
     GIT_COMMITTER_EMAIL="${GIT_COMMITTER_EMAIL}" \
     git commit -m "${COMMIT_MESSAGE}" --author="${DEPLOY_AUTHOR}"

echo "RUN THIS MANUALLY"
echo ""
echo cd "${LOCALGIT}"
echo git push -u "${DEPLOY_REMOTE_NAME}" "${DEPLOY_BRANCH}" --force

# GIT_COMMITTER_NAME="${GIT_COMMITTER_NAME}" \
#   GIT_COMMITTER_EMAIL="${GIT_COMMITTER_EMAIL}" git commit --author="New Name <name@email.com>

# /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/systema/cache/gh-pages-temp-git
# http://git.workspace.localhost/HXL-CPLP/Auxilium-Humanitarium-API/systema/cache/gh-pages-temp-git/docs/
# https://ohshitgit.com/
#   git reflog

# openapi-generator-cli list
# openapi-generator-cli dynamic-html help
