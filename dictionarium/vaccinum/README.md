# HXL-CPLP-Dictionarium_Vaccinum
- GitHub issue:
  - <https://github.com/HXL-CPLP/forum/issues/59>
- HXL-CPLP-Dictionarium_Vaccinum:
  - <https://docs.google.com/spreadsheets/d/1couRYFuVLnr6CfIMEiXKBamJtmcHinSAy1K1e69rNqw/edit#gid=610054072>

---
## Auxilium

### por-Latn

A HXL-CPLP-Dictionarium_Vaccinum é um dicionário multilingual temático,
com conceitos relacionados à terminologia de troca de dados relacionados
à vacinação e desde o início é ao domínio público.

Da mesma forma que um dicionário tradicional, o processo de decisão é
extremamente humano, então some-se o fato de que é multilingual
(com flexibilidade para aceitar traduções, que também precisam ser revistas)
bem como, diferente de dicionários tradicionais, tem intenção de permitir
colunas não relacionadas a traduções, mas como alguma norma técnica
implementa o conceito.

A ideia de "norma técnica" é flexível: em geral significa como determinado
governo publica colunas de dados do respectivo conceito.
Em outras palavras: **pode relacionar não só traduções em língua natural
que poderia ajudar com documentação) como equivalência entre padrões
de dados diferentes**

#### Como consumir os dados dela

##### Padrão HXL

A planilha é, imediatamente, processável usando ferramentas compatíveis
com HXL Standard, que é um padrão usado no meio humanitário.

Porém, exceto se você já está confortável em processar CSVs,
muito provavelmente você vai transformar o conceito dela em algo que
seus programas entendam.

##### Formatos de trabalho mais tradicionais

As HXL usadas nela tem a disposição também utilitário mais
especializado para exportar e (com exceções) importar de volta de todos
os formatos suportados por HXLTM (nome temporário),
vide <https://hdp.etica.ai/hxltm/archivum/>.

Entre os formados de saída, tem desde JSON a XMLs como TBX, XLIFF,
TMXs. Porém é fácil criar exportadores novos!

A ontologia usada pelo HXLTM também é configurável,
vide <https://github.com/EticaAI/HXL-Data-Science-file-formats/blob/main/ontologia/cor.hxltm.yml>,
dando flexibilidade adicional para ensinar como exportar/importar
variáveis em nível individual. Também é possível criar um exportador
mais especializado usando sintaxe liquid
<https://shopify.github.io/liquid/> que é popular entre pessoas que
não são programadoras.

#### Exportação por template customizado
> Nota de performance: esse tipo de implementação, diferente de padrão
criado no ponto anterior, não é otimizado para arquivos de
dicionário HXLTM que não caibam na memória do seu computador.

> Nota de maturidade de especificação: esta abordagem para exportar
informação é mais recente e deve sofrer alterações.

Uma outra estratégia de exportar dados de planilhas HXLTM é criar
templates que usam as variáveis. Estes templates podem ser desde documentação,
como um arquivo usado para gerar um glossário em PDF,
como pequenos programas executáveis.

> TODO: explicar melhor sobre como criar scripts

### Limitações que devem ser resolvidas com software

> TODO: explicar melhor sobre problemas que serão necessários para converter
dados entre implementações regionais diferentes (usand software) sem
sobrecarregar trabalho quem gerencia as planilhas.

## Exemplos de comandos

### (rascunho)

```bash
## A parir do diretório raíz do projeto, imprima em tela

hxltmcli _data/tm/vaccinum.tm.hxl.csv \
  --objectivum-formulam dictionarium/vaccinum/programma/vaccinum-transfarmandum.🗣️.py \
  --objectivum-linguam por-Latn --agendum-linguam eng-Latn,lat-Latn \
  --fontem-normam 076_BR \
  --objectivum-normam 840_US_USCA

# US não tem P-Codes oficiais, 'US-CA' é gambiarra temporária (2021-10-14)

## Salva em subpasta

hxltmcli _data/tm/vaccinum.tm.hxl.csv \
  --objectivum-formulam dictionarium/vaccinum/programma/vaccinum-transfarmandum.🗣️.py \
  --objectivum-linguam por-Latn --agendum-linguam eng-Latn,lat-Latn \
  --fontem-normam 076_BR \
  --objectivum-normam 840_US_USCA \
  > dictionarium/vaccinum/programma/resultatum/vaccinum-transfarmandum.076_BR---840_US_USCA.py

hxltmcli _data/tm/vaccinum.tm.hxl.csv \
  --objectivum-formulam dictionarium/vaccinum/programma/vaccinum-transfarmandum.🗣️.sh \
  --objectivum-linguam por-Latn --agendum-linguam eng-Latn,lat-Latn \
  --fontem-normam 076_BR \
  --objectivum-normam 840_US_USCA \
  > dictionarium/vaccinum/programma/resultatum/vaccinum-transfarmandum.076_BR---840_US_USCA.sh

hxltmcli _data/tm/vaccinum.tm.hxl.csv \
  --objectivum-formulam dictionarium/vaccinum/programma/vaccinum-transfarmandum.🗣️.json \
  --objectivum-linguam por-Latn --agendum-linguam eng-Latn,lat-Latn \
  --fontem-normam 076_BR \
  --objectivum-normam 840_US_USCA \
  > dictionarium/vaccinum/programma/resultatum/vaccinum-transfarmandum.076_BR---840_US_USCA.json

## Depuração, template de exemplo
# --expertum-HXLTM-ASA asa.hxltm.yml: gera uma Abstract Syntax Tree (AST) da operação
hxltmcli _data/tm/vaccinum.tm.hxl.csv \
  --objectivum-formulam dictionarium/vaccinum/programma/venandum-insectum.🗣️.json \
  --expertum-HXLTM-ASA dictionarium/vaccinum/programma/resultatum/venandum-insectum.asa.hxltm.yml \
  --objectivum-linguam por-Latn --agendum-linguam eng-Latn,lat-Latn \
  --fontem-normam 076_BR \
  --objectivum-normam 840_US_USCA

```

<!--
./dictionarium/vaccinum/programma/resultatum/vaccinum-transfarmandum.076_BR---840_US_USCA.py
./dictionarium/vaccinum/programma/resultatum/vaccinum-transfarmandum.076_BR---840_US_USCA.sh


hxltmcli _data/tm/vaccinum.tm.hxl.csv --objectivum-formulam dictionarium/vaccinum/programma/vaccinum-transfarmandum.🗣️.py --objectivum-linguam por-Latn --agendum-linguam eng-Latn,lat-Latn
-->

<!--

## schemam

### UN
> Trivia: "UN" de https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Exceptional_reservations

#### covid-19-vaccinations

- [schemam/UN/covid-19-vaccinations/formulam.hxl.csv](schemam/UN/covid-19-vaccinations/formulam.hxl.csv)
  - <https://data.humdata.org/dataset/covid-19-vaccinations>

#### immunization-campaigns-impacted

- [schemam/UN/immunization-campaigns-impacted/formulam.hxl.csv](schemam/UN/immunization-campaigns-impacted/formulam.hxl.csv)
  - <https://data.humdata.org/dataset/immunization-campaigns-impacted>

#### brazil-epidemiological-and-hospital-indicators-on-covid-19-in-ouro-preto

> TODO: <https://data.humdata.org/dataset/brazil-epidemiological-and-hospital-indicators-on-covid-19-in-ouro-preto>

### 076
> Trivia: "076" de https://unstats.un.org/unsd/methodology/m49/


#### brasil.io
- [schemam/076/brasil.io/datapackage.🗣️.json](schemam/076/brasil.io/datapackage.🗣️.json)
  - <https://github.com/turicas/covid19-br/blob/master/datapackage.json>

#### covid-19-vacinacao

- [schemam/076/covid-19-vacinacao/formulam.csv](schemam/076/covid-19-vacinacao/formulam.csv)
  - <https://opendatasus.saude.gov.br/dataset/covid-19-vacinacao>

#### okbr
- [schemam/076/okbr/formulam.csv](schemam/076/okbr/formulam.csv)
  - <https://transparenciacovid19.ok.org.br/files/Toolkit_1_microdados_basicosV2.pdf>


### 840
> Trivia: "840" de https://unstats.un.org/unsd/methodology/m49/

https://data.chhs.ca.gov/dataset/vaccine-progress-dashboard
-->

<!--
> - HDX, Brazil:
>   - https://data.humdata.org/event/covid-19?groups=bra&q=&ext_page_size=25
-->

<!--
- https://data.humdata.org/event/covid-19 (?)
- https://data.unicef.org/resources/dataset/immunization/
- https://data.chhs.ca.gov/dataset/vaccine-progress-dashboard
  - https://data.chhs.ca.gov/dataset/vaccine-progress-dashboard/resource/d995e0fa-aa50-43e3-9753-94e9bf1df12f?view_id=3ff59c71-4e7d-41cb-878b-4468c0a80ba1
  - https://data.chhs.ca.gov/dataset/vaccine-progress-dashboard/resource/130d7ba2-b6eb-438d-a412-741bde207e1c

-->
