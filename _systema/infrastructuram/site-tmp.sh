#!/bin/sh
#===============================================================================
#
#          FILE:  temporarium.sh
#
#         USAGE:  _systema/infrastructuram/site-tmp.sh
#
#   DESCRIPTION:  Manual symbolic link to linux temporary dir instead of local
#                 _site. Not finished.
#                 Better just use _config_dev.yml 
#                    destination: /tmp/jekyll_site/
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
#       VERSION:  v1.0-draft
#       CREATED:  2021-06-24 18:04 UTC started
#      REVISION:  ---
#===============================================================================

echo "Better just use _config_dev.yml"
echo "see https://stackoverflow.com/questions/30127216/can-i-change-jekylls-temp-directory"
exit 1


ROOTDIR="$(pwd)"
TEMPDIR_BASE="/tmp"
TEMPDIR="${TEMPDIR_BASE}/_site"
DESTDIR="${ROOTDIR}/_site"


echo "ROOTDIR $ROOTDIR"
echo "TEMPDIR_BASE $TEMPDIR_BASE"
echo "TEMPDIR $TEMPDIR"
echo "DESTDIR $DESTDIR"

if [ -d "${DESTDIR}" ]; then
    echo "${DESTDIR} okay"
    exit 0
fi

if [ ! -d "${DESTDIR}" ]; then
    echo "mkdir ${DESTDIR}"
    mkdir "${DESTDIR}"
    # exit 0
fi


# ln -s /tmp/jekyll_site/ /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/_site
ln -s /tmp/jekyll_site/ "$DESTDIR"
