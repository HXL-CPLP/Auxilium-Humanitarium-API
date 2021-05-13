# _data

> - [documentum/README.md](documentum/README.md)
> - [_data/README.md](_data/README.md)
> - [GSheets: HXL-CPLP-Vocab_Auxilium-Humanitarium-API_L10n](https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279)

## Note to maintainers in English

- <https://translate.google.com/translate?sl=pt&tl=en&u=https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/blob/main/_data/README.md>

## Notas aos mantenedores em português

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
