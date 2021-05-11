# systema

> Trivia:
> - "systēma"
>   - <https://en.wiktionary.org/wiki/systema#Latin>
> - "programma"
>   - https://en.wiktionary.org/wiki/programma#Italian
>     - Late Latin programma
>     - Ancient Greek πρόγραμμα (prógramma)
> - "displicandum"
>   - https://en.wiktionary.org/wiki/displico#Latin
>   - English, "deploy", "deployment"
>     - https://en.wiktionary.org/wiki/deploy
> - "infrastrūctūram", "infra"" + "strūctūram"
>   - "infra-"
>     - https://en.wiktionary.org/wiki/infra-#English
>   - "structure"
>     - https://en.wiktionary.org/wiki/structura#Latin
>     - https://en.wiktionary.org/wiki/structure#English
> - "temporārium"
>   - temporārium, https://en.wiktionary.org/wiki/temporarius#Latin
<!--
cd systema || exit
npm run displicandum-gh-pages

npm uninstall -g gh-pages
# npm install -g gh-pages@2.0.1
npm install -g gh-pages@2.1.1

cd /workspace/git/temp/ || exit
mkdir test-gh-pages
cd  /workspace/git/temp/test-gh-pages || exit
git init
echo "Test" > README.md
git remote add upstream https://example.com/test.git
git remote add origin https://example.com/test.git
gh-pages -d .  --no-push  --git "$(which git)"


## Com versao 2.0.1 parametro --git nao existe
# fititnt@bravo:/workspace/git/HXL-CPLP/Auxilium-Humanitarium-API$ gh-pages -d .  --no-push

##  gh-pages@2.1.1
cd /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API
gh-pages --dist . -dest 'docs/' --branch gh-pages --user 'HXL-CPLP bot <no-reply@etica.ai>' --no-push --no-history
-->