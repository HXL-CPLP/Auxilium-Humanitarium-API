# HXL TM exemplum
- https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/issues/16
- https://github.com/HXL-CPLP/forum/issues/58

<!-- TOC -->

- [HXL TM exemplum](#hxl-tm-exemplum)
    - [Exemplum: okf_table_src-tab-trg](#exemplum-okf_table_src-tab-trg)
    - [Exemplum: schemam-un-htcds_eng-Latn--por-Latn](#exemplum-schemam-un-htcds_eng-latn--por-latn)

<!-- /TOC -->

<!--
NOTE: seems that --remove-headers work on almost every place, except
      on hxlspec. Also, the json spec do not document at all some way to remove the
      headers on the JSON spec (but the proxy API version allow this)
      (Emerson Rocha, 2021-06-26)
-->

- \_[eng-Latn] **Recommeded**: use the schemam-un-htcds.tm.hxl HXL-proxy 
 1-hour cached version of theto avoid Google returning 400 erros or save the
 file locally and change some options[eng-Latn]\_
  - <https://proxy.hxlstandard.org/data/download/schemam-un-htcds_tm_hxl.csv?dest=data_edit&url=https%3A%2F%2Fdocs.google.com%2Fspreadsheets%2Fd%2F1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4%2Fedit%23gid%3D1292720422>
  - `"input": "_hxltm/schemam-un-htcds.tm.hxl.csv"` + `"allow_local": true`

---

```sh
## _[eng-Latn]Required: libhxl, provides hxlspec and more [eng-Latn]_
# pip install libhxl
# @see https://github.com/HXLStandard/libhxl-python

pip3 show libhxl | grep Version
# Version: 4.22

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

ls -a _hxltm/schemam-un-htcds.tm.hxl.csv
# _hxltm/schemam-un-htcds.tm.hxl.csv

```

---

## Exemplum: okf_table_src-tab-trg
- Archīvum: [hxltm_2_okf_table_src-tab-trg.hxlspec.json](hxltm_2_okf_table_src-tab-trg.hxlspec.json)
- Auxilium: 
  - https://okapiframework.org/wiki/index.php/Table_Filter
  - https://site.matecat.com/support/managing-language-resources/add-glossary/


```sh

### ACTUM I
# _[eng-Latn] Use HXL JSON Spec to reduce an HXL TM to a translation pair [eng-Latn]_

hxlspec _hxltm/exemplum/hxltm_2_okf_table_src-tab-trg.hxlspec.json > _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp1.csv

head -n4  _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp1.csv
#    pt,en,Comment
#    #x_target,#x_source,#x_comment
#    Língua portuguesa (alfabeto latino),English language (Latin script),Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅
#    por-Latn,eng-Latn,||∅

### ACTUM II
# _[eng-Latn] Since we have different column order, we enforce it here [eng-Latn]_
csvcut -c en,pt,Comment _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp1.csv > _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp2.csv

head -n4 _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp2.csv
#    en,pt,Comment
#    #x_source,#x_target,#x_comment
#    English language (Latin script),Língua portuguesa (alfabeto latino),Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅
#    eng-Latn,por-Latn,||∅

### ACTUM III
# _[eng-Latn] Remove only the '#x_target,#x_source,#x_comment' line [eng-Latn]_

sed -i '2d' _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp2.csv
#    en,pt,Comment
#    English language (Latin script),Língua portuguesa (alfabeto latino),Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅
#    eng-Latn,por-Latn,||∅
#    English language,Língua portuguesa,||∅

### ACTUM IV
# _[eng-Latn] Generate a Tab-separed CSV (a TSV) [eng-Latn]_
csvformat --out-tabs _hxltm/out/hxltm_2_okf_table_src-tab-trg_temp2.csv > _hxltm/out/hxltm_2_okf_table_src-tab-trg.tsv

head -n4 _hxltm/out/hxltm_2_okf_table_src-tab-trg.tsv
#    en	pt	Comment
#    English language (Latin script)	Língua portuguesa (alfabeto latino)	Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅
#    eng-Latn	por-Latn	||∅
#    English language	Língua portuguesa	||∅

### ACTUM V
# _[eng-Latn] Create an XLIFF 2 file [eng-Latn]_

sh /opt/okapi/tikal.sh -x _hxltm/out/hxltm_2_okf_table_src-tab-trg.tsv -fc okf_table_src-tab-trg -nocopy
#    -------------------------------------------------------------------------------
#    Okapi Tikal - Localization Toolset
#    Version: 2.1.41.0
#    -------------------------------------------------------------------------------
#    Extraction
#    Source language: en
#    Target language: pt-BR
#    Default input encoding: UTF-8
#    Filter configuration: okf_table_src-tab-trg
#    Output: /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/_hxltm/out/hxltm_2_okf_table_src-tab-trg.tsv.xlf
#    Input: /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/_hxltm/out/hxltm_2_okf_table_src-tab-trg.tsv
#    Done in 0.772s


```

`_hxltm/out/hxltm_2_okf_table_src-tab-trg.tsv.xlf`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xliff version="1.2" xmlns="urn:oasis:names:tc:xliff:document:1.2" xmlns:okp="okapi-framework:xliff-extensions" xmlns:its="http://www.w3.org/2005/11/its" xmlns:itsxlf="http://www.w3.org/ns/its-xliff/" its:version="2.0">
<file original="_hxltm/out/hxltm_2_okf_table_src-tab-trg.tsv" source-language="en" target-language="pt-BR" datatype="x-text/csv" okp:inputEncoding="UTF-8">
<body>
<group id="3" restype="row">
<trans-unit id="1">
<source xml:lang="en">en</source>
<target xml:lang="pt-BR">pt</target>
<note>Comment</note>
</trans-unit>
</group>
<group id="6" restype="row">
<trans-unit id="2">
<source xml:lang="en">English language (Latin script)</source>
<target xml:lang="pt-BR">Língua portuguesa (alfabeto latino)</target>
<note>Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅</note>
</trans-unit>
</group>
<!-- (...) -->

<group id="438" restype="row">
<trans-unit id="129">
<source xml:lang="en">This division includes activities of households as employers of domestic personnel. Furthermore, it includes the undifferentiated subsistence goods-producing and services producing activities of households.</source>
<target xml:lang="pt-BR"></target>
</trans-unit>
</group>
<group id="441" restype="row">
<trans-unit id="130">
<source xml:lang="en">This class includes activities (...)</source>
<target xml:lang="pt-BR"></target>
</trans-unit>
</group>
</body>
</file>
</xliff>

```

## Exemplum: schemam-un-htcds_eng-Latn--por-Latn

- Archīvum: [schemam-un-htcds_eng-Latn--por-Latn.hxlspec.json](schemam-un-htcds_eng-Latn--por-Latn.hxlspec.json)

```sh
### ACTUM I
# _[eng-Latn] Use HXL JSON Spec to reduce an HXL TM to a translation pair [eng-Latn]_
hxlspec _hxltm/exemplum/schemam-un-htcds_eng-Latn--por-Latn.hxlspec.json > _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp1.csv

head -n4  _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp1.csv
#    Source ID,pt,en,Comment
#    #x_source_id,#x_target,#x_source,#x_comment
#    L10N_ego_summarius,Língua portuguesa (alfabeto latino),English language (Latin script),Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅
#    L10N_ego_codicem,por-Latn,eng-Latn,


### ACTUM II
# _[eng-Latn] Since we have different column order, we enforce it here [eng-Latn]_

csvcut -n _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp1.csv
#   1: Source ID
#   2: pt
#   3: en
#   4: Comment

csvcut -c 'en','pt','Comment',"Source ID" _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp1.csv > _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp2.csv

head -n4 _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp2.csv
#    en,pt,Comment,Source ID
#    #x_source,#x_target,#x_comment,#x_source_id
#    English language (Latin script),Língua portuguesa (alfabeto latino),Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅,L10N_ego_summarius
#    eng-Latn,por-Latn,,L10N_ego_codicem


### ACTUM III
# _[eng-Latn] Remove only the '#x_source_id,#x_source,#x_target,#x_comment' line [eng-Latn]_

sed -i '2d' _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp2.csv

head -n4 _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp2.csv
#    Source ID,en,pt,Comment
#    L10N_ego_summarius,English language (Latin script),Língua portuguesa (alfabeto latino),Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅
#    L10N_ego_codicem,eng-Latn,por-Latn,
#    L10N_ego_linguam_nomen,English language,Língua portuguesa,

### ACTUM IV
# _[eng-Latn] CSV format [eng-Latn]_
cp _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn_temp2.csv _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.csv

# _[eng-Latn] Generate a Tab-separed CSV (a TSV) [eng-Latn]_
csvformat --out-tabs _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.csv > _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv

head -n4 _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv
#    en	pt	Comment	Source ID
#    English language (Latin script)	Língua portuguesa (alfabeto latino)	Q1|https://github.com/HXL-CPLP/forum/issues/58|https://example.org|∅	L10N_ego_summarius
#    eng-Latn	por-Latn		L10N_ego_codicem
#    English language	Língua portuguesa		L10N_ego_linguam_nomen

### ACTUM V
# _[eng-Latn] Create an XLIFF 2 file [eng-Latn]_

# sh /opt/okapi/tikal.sh -x _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.csv -fc okf_table_src-tab-trg -nocopy
sh /opt/okapi/tikal.sh -x _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.csv -nocopy

# Isso funciona
sh /opt/okapi/tikal.sh -x _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv -fc okf_table_src -nocopy


sh /opt/okapi/tikal.sh -x _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv -fc okf_table_src@hapi2 -nocopy
-------------------------------------------------------------------------------
Okapi Tikal - Localization Toolset
Version: 2.1.41.0
-------------------------------------------------------------------------------
Extraction
# Error: Cannot find filter configuration 'okf_table_src'
# Error: Cannot find filter with ID: okf_table_src. Cannot add configuration
# Source language: en
# Target language: pt-BR
# Default input encoding: UTF-8
# Filter configuration: okf_table_src@hapi2
# Output: /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/_hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv.xlf
# Input: /workspace/git/HXL-CPLP/Auxilium-Humanitarium-API/_hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv
# Error: Cannot find filter configuration 'okf_table_src@hapi2'
# Error: Unsupported filter type 'okf_table_src@hapi2'.
# You can use the -trace option for more details.

sh /opt/okapi/tikal.sh -x _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv -gs /home/fititnt/okf_table_src@hapi2.fprm -nocopy -trace

sh /opt/okapi/tikal.sh -x _hxltm/out/schemam-un-htcds_eng-Latn--por-Latn.tsv -gs /home/fititnt/Downloads/okf_table_src@hapi2.fprm -nocopy -trace

# -------------------------------------------------------------------------------
# Okapi Tikal - Localization Toolset
# Version: 2.1.41.0
# -------------------------------------------------------------------------------
# Trace: 1 class net.sf.okapi.applications.tikal.Main
# Trace: 2 ProtectionDomain  (file:/opt/okapi/lib/okapi-application-tikal-1.41.0.jar <no signer certificates>)
#  sun.misc.Launcher$AppClassLoader@3fee733d
#  <no principals>
#  java.security.Permissions@3b08f438 (
#  ("java.io.FilePermission" "/opt/okapi/lib/okapi-application-tikal-1.41.0.jar" "read")
#  ("java.lang.RuntimePermission" "exitVM")
# )


# Trace: 3 (file:/opt/okapi/lib/okapi-application-tikal-1.41.0.jar <no signer certificates>)
# Trace: 4 file:/opt/okapi/lib/okapi-application-tikal-1.41.0.jar
# Trace: 5 /opt/okapi/lib/okapi-application-tikal-1.41.0.jar
# Error: Cannot find filter configuration 'okf_table_src'
# Error: Cannot find filter with ID: okf_table_src. Cannot add configuration
# Extraction
# net.sf.okapi.common.exceptions.OkapiException: Could not guess the configuration for the extension '.tsv'
# 	at net.sf.okapi.applications.tikal.Main.getConfigurationId(Main.java:751)
# 	at net.sf.okapi.applications.tikal.Main.guessMissingParameters(Main.java:882)
# 	at net.sf.okapi.applications.tikal.Main.process(Main.java:999)
# 	at net.sf.okapi.applications.tikal.Main.main(Main.java:604)


## TODO: estou tendo MESMO problema que este issue aqui
##  >>> https://bitbucket.org/okapiframework/okapi/issues/1053/an-error-occurred-when-extracting-from-the
```

