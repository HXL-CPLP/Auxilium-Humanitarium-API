# Auxilium Humanitarium API documentōrum <sup>(alpha)</sup>

[![Site](https://img.shields.io/badge/Site-hapi.etica.ai-blue)](https://hapi.etica.ai) 
[![HXL-CPLP/Auxilium-Humanitarium-API](https://img.shields.io/badge/GitHub-HXL--CPLP%2FAuxilium--Humanitarium--API-lightgrey?logo=github&style=social)](https://github.com/HXL-CPLP/Auxilium-Humanitarium-API) 
[![GitHub Repo stars](https://img.shields.io/github/stars/HXL-CPLP/Auxilium-Humanitarium-API?style=social)](https://github.com/HXL-CPLP/Auxilium-Humanitarium-API) 
[![Download .zip](https://img.shields.io/badge/Download-.zip-brightgreen)](https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/archive/refs/heads/main.zip)

## Praefātiōnem

1. **❓🌐 https://hapi.etica.ai/ 🌐❓**
    1. ❗ https://github.com/HXL-CPLP/hapi.etica.ai ❗
        1. ❗ https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/actions ❗
            1. ❗[.github/workflows/05-deploy-github-pages.yml](.github/workflows/05-deploy-github-pages.yml) ❗
                1. ❗https://github.com/HXL-CPLP/Auxilium-Humanitarium-API ❗
                2. ❗[docs.google.com: HXL-CPLP-Vocab_Auxilium-Humanitarium-API](https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279)❗
                    1. 🆘 https://support.google.com/docs/answer/6000292 🆘
2. **❓🔤 https://hapi.etica.ai/por-Latn/ 🔤❓**
    1. ❗ [GitHub.com: documentum/por-Latn/](documentum/por-Latn/) ❗
    2. ❗ [docs.google.com:: HXL-CPLP-Vocab_Auxilium-Humanitarium-API](https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279)❗
3. **❓🔤 https://hapi.etica.ai/eng-Latn/ 🔤❓**
    1. ❗ [GitHub.com: documentum/eng-Latn/](documentum/eng-Latn/) ❗
        1. ❗ [docs.google.com: HXL-CPLP-Vocab_Auxilium-Humanitarium-API](https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279)❗

> @TODO: [por] adicionar mais links

## English

### Note to maintainers in English

- <https://translate.google.com/translate?sl=pt&tl=en&u=https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/blob/main/README.md>

## Español

### Nota para mantenedores en español

- <https://translate.google.com/translate?sl=pt&tl=es&u=https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/blob/main/README.md>

## Português

Seja uma pessoa bem vinda ao projeto **Documentação interativa para APIs humanitárias**!

Neste momento, 2021-05-16, este projeto está em fase de desenvolvimento alfa e,
ainda que o site hapi.etica.ai possa ser usado pelo publico final, não há
documentação em como aceitar colaboração externa. Se você já não foi convidado
por algum de nossos membros e tem nosso contato direto, por favor entre em
contato por e-mail, Facebook, WhatsApp, LinkedIn ou o que for com membros do
HXL-CPLP.

### Introdução rápida

- **Site público**: <https://hapi.etica.ai/>
- **GitHub, código fonte**: <https://github.com/HXL-CPLP/Auxilium-Humanitarium-API>
- **GitHub, código fonte de hapi.etica.ai**: <https://github.com/HXL-CPLP/hapi.etica.ai>
- **Fontes de dados externas**:
  - [docs.google.com: HXL-CPLP-Vocab_Auxilium-Humanitarium-API](https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279)


#### Executar o Jekyll localmente

##### Configuração inicial (apenas uma vez): obter cópia e instalar dependências

- Como clonar repositório?
  - <https://docs.github.com/pt/repositories/creating-and-managing-repositories/cloning-a-repository>
- Como instalar dependências do bundler?
  - <https://bundler.io/>

```bash
# Existem pelo menos 3 formas de clonar o repositório. Esta não requer
# configurar credenciais de acesso. Você talvez queria criar próprio fork
git clone https://github.com/HXL-CPLP/Auxilium-Humanitarium-API.git
cd Auxilium-Humanitarium-API

# Como instalar Ruby e o Bundler: não explicado aqui

# Uma das formas de definir onde ficariam instaladas as dependências
bundle config set path 'vendor/bundle'

# Instala, de fato, as dependências
bundle install
```

##### Dia a dia: executar versão local

```bash
JEKYLL_ENV=development bundle exec jekyll serve --config _config.yml,_config_dev.yml

# JEKYLL_ENV=development bundle exec jekyll serve --incremental
# Server address: http://127.0.0.1:4000/

## Debug
JEKYLL_ENV=development bundle exec jekyll serve --config _config.yml,_config_dev.yml --trace --watch

## Velocidade
bundle exec jekyll serve --config _config.yml,_config_dev.yml --profile

```

### Tópico especial: de onde "vem os dados do site"?

#### Resposta curta

Se você estiver fazendo um clone local, ele usará tanto arquivos YAML
(que são projetados para ser editados usando git) como arquivos HXLizados
que contém as traduções.

Caso você queira ajudar com traduções, por favor, entre em contato com
mantenedores que explicamos a você.

#### Resposta para pessoas mantenedoras

Ao usar `bundle exec jekyll serve` os arquivos de dados locais funcionam como
um **tipo de cacheamento** (bem como um implicitamente um histórico),
**porém pessoas colaboradoras** (mesmo que não sejam quem cria as traduções,
mas sim os YAMLs) **também tem acesso de edição nas planilhas**.

O arquivo [Rakefile](Rakefile) tem atalhos para algumas rotinas comuns do
utilitário de linha de comando rake (veja <https://ruby.github.io/rake/>).

```bash
### Roda as tarefas padrões (exceto testes e limpeza de cache local)
# No mínimo irá baixar todas as planilhas que são editadas colaborativamente
# por humanos no GSheets.
rake

### Roda testes (exemplo: checagem de links quebrados)
rake test

### Deleta caches intermediários
# Como o site é executado DUAS vezes antes de estar pronto (isto é, na primeria
# vez que o site é executado, se não houver cache, ele pede para rodar de novo)
# Existe situação onde quem trabalhar localmente pode ter um cache
# intermediário que impede terminar o ciclo. O comando a seguir limpa esses
# arquivos
rake purgatorium
```

### Tópico especial: planilhas foram alteradas, mas não precisa editar códigos e YAML. O que fazer para atualizar o hapi.etica.ai?

Vá em <https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/actions>, encontre
um teste qualquer recente e clique **"Re-run all jobs"**.

O [.github/workflows/05-deploy-github-pages.yml](.github/workflows/05-deploy-github-pages.yml)
é instruído a sempre baixar arquivos das planilhas online e ignorar os caches
salvos no GitHub.

<!--
O motivo para **independente** do que for enviado nos commits dos CSVs de dados
a automação baixar novamente eles antes de enviar para <https://hapi.etica.ai>
é justamente 

### `_data/L10n.hxl.csv`
- Automação
  - Script: [_systema/programma/download-hxl-datum.sh](_systema/programma/download-hxl-datum.sh)
  - GitHub action: [.github/workflows/05-deploy-github-pages.yml](.github/workflows/05-deploy-github-pages.yml)
- Arquivo: [_data/L10n.hxl.csv](_data/L10n.hxl.csv)
- GSheets: HXL-CPLP-Vocab_Auxilium-Humanitarium-API_L10n
  - https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279

O arquivo `_data/L10n.hxl.csv` é obtido automaticamente antes da publicação no
GitHub pages com ajuda do script `_systema/programma/download-hxl-datum.sh`.

É possivel usar uma versão antiga desse arquivo ao testar com Jekyll localmente,
porém qualquer customização, mesmo que commitada neste repositório, caso
não esteja também em _GSheets: HXL-CPLP-Vocab_Auxilium-Humanitarium-API_L10n_
sera completamente ignorada.
-->

<!--
### Licença
--TODO: o texto em português da licença é um rascunho. Ainda precisa ser revisado

[![Public Domain Dedication](https://i.creativecommons.org/p/zero/1.0/88x31.png)](https://unlicense.org/)

Na medida do possível sob a lei, as pessoas autoras de
[HXL-CPLP](https://github.com/HXL-CPLP) renunciam todos os direitos autorais e
direitos conexos ou vizinhos a este trabalho para o [domínio público](https://unlicense.org/).
-->

## Voluntarius Auxilio Tuo

- [_data/agnitionem/humanum.yml](_data/agnitionem/humanum.yml)

<!--
Trivia:
- fundātōrem
  - https://en.wiktionary.org/wiki/fundator#Latin
- "pictūram"
  - https://en.wiktionary.org/wiki/pictura#Latin
- "opus"
  - https://en.wiktionary.org/wiki/opus#Latin
- "trānslātiōnem"
  - https://en.wiktionary.org/wiki/translatio#Latin
- "baptismum"
  - https://en.wiktionary.org/wiki/translatio#Latin
- "abecedāriam"
  - https://en.wiktionary.org/wiki/abecedaria
- "trānslātiōnem"
  - https://en.wiktionary.org/wiki/translatio#Latin
- "commūnitātem"
  - https://en.wiktionary.org/wiki/communitas
- "auxilium"
  - https://en.wiktionary.org/wiki/auxilium
- "Grātiās agere"
  - https://en.wiktionary.org/wiki/gratias_ago#Latin
-->

```yaml

- nomen:
    abecedariam: Latn
    baptismum: Thalles Augusto
  opus:
    - fundatarem
  picturam: https://avatars.githubusercontent.com/u/61105850?v=4
  iri: https://github.com/ThesllaDev
  github: https://github.com/ThesllaDev
  linkedin: https://www.linkedin.com/in/thalles-augusto/

- nomen:
    abecedariam: Latn
    baptismum: Emerson Rocha
  opus:
    - fundatarem
  picturam: https://avatars.githubusercontent.com/u/812299?v=4
  iri: https://github.com/fititnt
  github: https://github.com/fititnt
  linkedin: https://www.linkedin.com/in/fititnt/

- nomen:
    abecedariam: Latn
    baptismum: Sine nomine (multis clanculum civibus)
    translatianem:
      Arab:
      Cyrl:
      Hans:
      # Latn:
  opus:
    - translationem
    - commanitatem-auxilium
  picturam: https://avatars.githubusercontent.com/u/50434491?v=4
  iri: https://github.com/eticaaibot
  github:
  gitee:
  linkedin:

```

# Licentiam

<!--
- https://www.sqlite.org/copyright.html
-->

[![Dominium publicum](https://i.creativecommons.org/p/zero/1.0/88x31.png)](https://unlicense.org/)

Licentiam: [Dominium publicum](https://unlicense.org/).
