#!/bin/sh
#===============================================================================
#
#          FILE:  okapi-install-locally.sh
#
#         USAGE:  ./_systema/infrastructuram/okapi-install-locally.sh
#
#   DESCRIPTION:  ---
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  java
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0
#       CREATED:  2021-06-26 22:11 UTC started as okapi-install-locally.sh
#      REVISION:  ---
#===============================================================================
set -e

# Trivia:
# - "Okapi Framework"
#   - https://okapiframework.org/
#   - https://okapiframework.org/wiki/index.php?title=Main_Page
#   - https://okapiframework.org/wiki/index.php/Table_Filter

if [ -f "/opt/okapi/tikal.sh" ]; then
    echo "Okapi already installed?"
    echo "    sh /opt/okapi/tikal.sh --info"
    sh /opt/okapi/tikal.sh --info
    echo "Exiting okapi-install-locally.sh"
    exit 0
fi

if [ ! -d "/opt/okapi" ]; then
    echo "Please, if you do not need install as root, create this directory"
    echo "with your user permissions before running this script, like"
    echo "   sudo mkdir /opt/okapi"
    echo "   sudo chown 1000:1000 /opt/okapi"
    echo "It will not try to install with the current user"
    mkdir /opt/okapi
fi

# sudo mkdir /opt/okapi || echo "Already installed?" && exit 1

#### okapiframework requires java ______________________________________________
# echo "okapiframework requires java"
# xdg-open https://okapiframework.org/wiki/index.php/Main_Page

#### Get some version from lastest release _____________________________________
Okapi_cli_linux_zip="https://okapiframework.org/binaries/main/1.41.0/okapi-apps_gtk2-linux-x86_64_1.41.0.zip"

echo "wget ${Okapi_cli_linux_zip} ..."
wget --output-document /tmp/okapi.zip "${Okapi_cli_linux_zip}"

echo "unzip to /opt/okapi"
unzip /tmp/okapi.zip -d /opt/okapi

echo "Done. You can run with"
echo "    sh /opt/okapi/tikal.sh --info"
sh /opt/okapi/tikal.sh --info

echo 'Bye!'

exit 0
