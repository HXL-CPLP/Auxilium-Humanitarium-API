#!/bin/sh
#===============================================================================
#
#          FILE:  temporarium.sh
#
#         USAGE:  ./_systema/infrastructuram/temporarium.sh
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
#       CREATED:  2021-05-11 18:04 UTC started
#      REVISION:  ---
#===============================================================================

#### Create an exclusive SSH key for specific repository _______________________
### Create on local computer ---------------------------------------------------
# @see https://docs.github.com/en/developers/overview/managing-deploy-keys
# @see https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# @see https://github.com/marketplace/actions/github-pages-action#%EF%B8%8F-create-ssh-deploy-key

ssh-keygen -t ed25519 -C "etica.of.a.ai+HXL-CPLP-hapi.etica.ai@gmail.com" -f "$HOME/.ssh/eticaai/id_ed25519-hapi"

### Add on the deploy repository, [HXL-CPLP/hapi.etica.ai] ---------------------
# On our case is here
#  - https://github.com/HXL-CPLP/hapi.etica.ai/settings/keys
# If someone is create on a different project, change this

# fititnt@bravo:~$ tree "$HOME/.ssh/eticaai/"
# /home/fititnt/.ssh/eticaai/
# ├── id_ed25519-hapi
# └── id_ed25519-hapi.pub


#### Add ACTIONS_DEPLOY_KEY on [HXL-CPLP/Auxilium-Humanitarium-API] ____________
# @see https://github.com/marketplace/actions/github-pages-action#%EF%B8%8F-create-ssh-deploy-key

#### Change git push to use custom SSH key _____________________________________
### ALTERNATIVE ONE ------------------------------------------------------------
# @see https://stackoverflow.com/questions/7927750/specify-an-ssh-key-for-git-push-for-a-given-domain/7927828#7927828
# Without this step, the git will push as your user, not the new key

# cat "$HOME/.ssh/config.d/config_eticaai"
#    # (...)
#    Host github-as-hapi-user
#        User git
#        HostName github.com
#        IdentityFile ~/.ssh/eticaai/id_ed25519-hapi
#        IdentitiesOnly yes

# fititnt@bravo:~$ cat /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/systema/cache/gh-pages-temp-git/.git/config 
# [core]
#  	repositoryformatversion  = 0
# 	filemode = true
# 	bare = false
# 	logallrefupdates = true
# [remote "remote-publisher"]
#    # url = git@github.com:HXL-CPLP/hapi.etica.ai.git
# 	url = git@github-as-hapi-user:HXL-CPLP/hapi.etica.ai.git
# 	fetch = +refs/heads/*:refs/remotes/remote-publisher/*
# [branch "gh-pages"]
# 	remote = remote-publisher
# 	merge = refs/heads/gh-pages


### ALTERNATIVE TWO ------------------------------------------------------------
# @see https://stackoverflow.com/questions/7927750/specify-an-ssh-key-for-git-push-for-a-given-domain/43953433#43953433
# fititnt@bravo:/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API$ ./_systema/programma/displicandum-gh-pages.sh
#   manual instructions says
#       cd /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/_systema/cache/gh-pages-temp-git
#       git push -u remote-publisher gh-pages --force
# New command instead of git push -u remote-publisher gh-pages --force
#   GIT_SSH_COMMAND="ssh -i $HOME/.ssh/eticaai/id_ed25519-hapi" git push -u remote-publisher gh-pages --force

#### Allow travis publish to GH Pages repo _____________________________________

### Create travis encrypted things ---------------------------------------------
# @see https://docs.travis-ci.com/user/environment-variables#defining-encrypted-variables-in-travisyml
# @see https://snapcraft.io/travis
sudo snap install travis --edge

# @see https://docs.travis-ci.com/user/encrypting-files/#automated-encryption
 travis login --com --github-token "..."

# @see https://docs.travis-ci.com/user/encrypting-files/#automated-encryption
# travis encrypt-file -f "$HOME/.ssh/eticaai/id_ed25519-hapi" -r HXL-CPLP/Auxilium-Humanitarium-API
# travis encrypt-file -f "$HOME/.ssh/eticaai/id_ed25519-hapi" -r /github/HXL-CPLP/Auxilium-Humanitarium-API

# @see https://docs.travis-ci.com/user/best-practices-security#recommendations-on-how-to-avoid-leaking-secrets-to-build-logs

### Recommendations on how to avoid leaking secrets to build logs #
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

# fititnt@bravo:/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API$ travis encrypt-file -f "$HOME/.ssh/eticaai/id_ed25519-hapi" -r HXL-CPLP/Auxilium-Humanitarium-API
# Outdated CLI version, run `gem install travis`.
# repository not known to https://api.travis-ci.org/: HXL-CPLP/Auxilium-Humanitarium-API

# This works
# travis show -r travis-ci/travis-api

#### draft _____________________________________________________________________
# @see https://andy-carter.com/blog/setting-up-travis-locally-with-docker-to-test-continuous-integration
# @see https://stackoverflow.com/questions/21053657/how-to-run-travis-ci-locally
# @see https://stackoverflow.com/questions/21053657/how-to-run-travis-ci-locally/49019950#49019950

### simple sh script -----------------------------------------------------------
# @see https://docs.travis-ci.com/user/deployment/script/
