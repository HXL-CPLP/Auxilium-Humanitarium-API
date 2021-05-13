#!/usr/bin/env node

// DEPRECATED: Use displicandum-gh-pages.sh! (Emerson Rocha, 2021-05-08 08:04 UTC)

// Trivia:
// - "displicandum"
//   - https://en.wiktionary.org/wiki/displico#Latin
//   - English, "deploy", "deployment"
//     - https://en.wiktionary.org/wiki/deploy
// - 'gh-pages'
//   - https://www.npmjs.com/package/gh-pages
//   - https://pages.github.com/

// console.log(process.version);

// function npmls(cb) {
//     require('child_process').exec('npm ls --json', function(err, stdout, stderr) {
//       if (err) return cb(err)
//       cb(null, JSON.parse(stdout));
//     });
//   }
//   npmls(console.log);

// npm gh-pages ______________________________________________________________
// @see https://www.npmjs.com/package/gh-pages
// /// hotfix, why 3.0.0 = https://github.com/tschaub/gh-pages/issues/354
// npm install -g gh-pages@3.0.0

// Were in branch main at this point, publishing files to branch gh-pages folder docs/
//    gh-pages --src '**/*' --dest '.' --branch gh-pages --user 'HXL-CPLP bot <no-reply@etica.ai>' --no-push --no-history
//    gh-pages --dist '/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/' --dest 'docs/' --branch gh-pages --user 'HXL-CPLP bot <no-reply@etica.ai>' --no-push --no-history
// ./_systema/node_modules/gh-pages/bin/gh-pages.js --help

// node ./_systema/node_modules/gh-pages/bin/gh-pages.js --git git --no-push --no-history
// gh-pages --git "$(which git)"


// TODO: consider use --before-add 
//       https://www.npmjs.com/package/gh-pages#optionsbeforeadd

// ./_systema/programma/displicandum-gh-pages.js

import { publish } from 'gh-pages';

// console.log('Hello world!');

// var callback = console.log

publish(
    // We're using root folder of HXL-CPLP/Auxilium-Humanitarium-API/ as source
    // './',
    // TODO: remove hardcoded path
    '/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/',
    {
        // Branch to publish: gh-pages
        branch: 'gh-pages',

        // Directory to publish: docs/
        dest: 'docs/',

        // Copy .dotfiles to dest?: false
        dotfiles: false,

        // Only add, never remove from dest? : false
        add: false,

        // Remove files on dest before commit
        // remove: "node_modules/",
        remove: "_systema/",

        // Push to target repository
        push: false,

        // Keep history from other pages
        // Note: this would waste too much resources and branch main already
        //       have information to re-recreate pages
        history: false,

        // Avoid showing repository URLs or other information in errors.
        // silent: true,

        // Repo to publish (if not same local repo): (ommited)
        // repo: 'https://example.com/other/repo.git',

        // beforeAdd makes most sense when `add` option is active
        // Assuming we want to keep everything on the gh-pages branch
        // but remove just `some-outdated-file.txt`
        // async beforeAdd(git) {
        //     return git.rm('./some-outdated-file.txt');
        // },

        // Git remote to publish (if not same local repo): (ommited)
        // remote: 'upstream',

        message: 'Displicandum gh-pages' + (new Date).toISOString() + ': Auxilium Humanitarium API documentōrum',

        user: {
            name: 'HXL-CPLP bot',
            email: 'no-reply@etica.ai'
        }
    },
    function (err) {
        console.log(err)
    }
);

// // ghpages.publish('dist', {
// publish('./', {
//     branch: 'gh-pages',
//     // repo: 'https://example.com/other/repo.git'
// }, callback);