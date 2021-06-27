# _hxltm/exemplum/README.md

<!--
NOTE: seems that --remove-headers work on almost every place, except
      on hxlspec. Also, the json spec do not document at all some way to remove the
      headers on the JSON spec (but the proxy API version allow this)
      (Emerson Rocha, 2021-06-26)
-->

- \_[eng-Latn] **Recommeded**: use the schemam-un-htcds.tm.hxl HXL-proxy 
 1-hour cached version of theto avoid Google returning 400 erros. [eng-Latn]\_
  - <https://proxy.hxlstandard.org/data/download/schemam-un-htcds_tm_hxl.csv?dest=data_edit&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1292720422>


## Exemplum: fiat lux!
- Archīvum: [schemam-un-htcds_eng-Latn--por-Latn.hxlspec.json](schemam-un-htcds_eng-Latn--por-Latn.hxlspec.json)

```sh
## _[eng-Latn]Required: libhxl, provides hxlspec and more [eng-Latn]_
# pip install libhxl
# @see https://github.com/HXLStandard/libhxl-python

## _[eng-Latn]Suggested: csvkit, some operations, like reordering with csvcut, may need it [eng-Latn]_
# pip install csvkit
# @see https://csvkit.readthedocs.io/en/latest/

## _[eng-Latn]Required: okapi command line tools[eng-Latn]_
# _systema/infrastructuram/okapi-install-locally.sh
# @see https://okapiframework.org/wiki/index.php/Getting_Started

## _[eng-Latn] Create a local cache of the online resource on
##              _hxltm/schemam-un-htcds.tm.hxl.csv so you do not do a lot of
##             near automated requests direct to Google Drive
## [eng-Latn]_
wget -O _hxltm/schemam-un-htcds.tm.hxl.csv 'https://proxy.hxlstandard.org/data/download/schemam-un-htcds_tm_hxl.csv?dest=data_view&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1292720422&force=on'

hxlspec _hxltm/exemplum/schemam-un-htcds_eng-Latn--por-Latn.hxlspec.json > _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.csv

head -n3  _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.csv
#    Codicem,Lingua Lusitana,Lingua Lusitana (alternātīvum),Lingua Anglica,Lingua Anglica (alternātīvum),Lingua Anglica (meta)
#    #item+id,#item+i_pt+i_por+is_latn,#item+i_pt+i_por+is_latn+alt+list,#item+i_en+i_eng+is_latn,#item+i_en+i_eng+is_latn+alt+list,#meta+item+i_en+i_eng+is_latn
#    L10N_ego_summarius,Língua portuguesa (alfabeto latino),∅,English language (Latin script),∅,∅


```

## Exemplum: okf_table_src-tab-trg
- Archīvum: [hxltm_2_okf_table_src-tab-trg.hxlspec.json](hxltm_2_okf_table_src-tab-trg.hxlspec.json)
- Auxilium: 
  - https://okapiframework.org/wiki/index.php/Table_Filter
  - https://site.matecat.com/support/managing-language-resources/add-glossary/


```sh

hxlspec _hxltm/exemplum/hxltm_2_okf_table_src-tab-trg.hxlspec.json > _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp1.csv

head -n4  _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp1.csv
#    pt,en
#    #x_target,#x_source
#    Língua portuguesa (alfabeto latino),English language (Latin script)
#    por-Latn,eng-Latn

# Since we have different column order, we can re
csvcut -c en,pt _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp1.csv > _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp2.csv



```
