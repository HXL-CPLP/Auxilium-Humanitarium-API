#!/bin/sh
#===============================================================================
#
#          FILE:  temporarium.sh
#
#         USAGE:  ./systema/infrastructuram/temporarium.sh
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

ssh-keygen -t ed25519 -C "etica.of.a.ai+HXL-CPLP-hapi.etica.ai@gmail.com" -f "$HOME/.ssh/eticaai/id_ed25519-hapi"

### Add on the deploy repository -----------------------------------------------
# On our case is here
#  - https://github.com/HXL-CPLP/hapi.etica.ai/settings/keys
# If someone is create on a different project, change this

# fititnt@bravo:~$ tree "$HOME/.ssh/eticaai/"
# /home/fititnt/.ssh/eticaai/
# ├── id_ed25519-hapi
# └── id_ed25519-hapi.pub

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
# fititnt@bravo:/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API$ ./systema/programma/displicandum-gh-pages.sh
#   manual instructions says
#       cd /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/systema/cache/gh-pages-temp-git
#       git push -u remote-publisher gh-pages --force
# New command instead of git push -u remote-publisher gh-pages --force
#   GIT_SSH_COMMAND="ssh -i $HOME/.ssh/eticaai/id_ed25519-hapi" git push -u remote-publisher gh-pages --force


#### draft _____________________________________________________________________
# @see https://andy-carter.com/blog/setting-up-travis-locally-with-docker-to-test-continuous-integration
# @see https://stackoverflow.com/questions/21053657/how-to-run-travis-ci-locally
# @see https://stackoverflow.com/questions/21053657/how-to-run-travis-ci-locally/49019950#49019950

### simple sh script -----------------------------------------------------------
# @see https://docs.travis-ci.com/user/deployment/script/
