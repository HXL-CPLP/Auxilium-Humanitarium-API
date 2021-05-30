# _data/tm/README.md
> _[por] Isto é um rascunho [por]_

- https://en.wikipedia.org/wiki/Translation_memory#Related_standards
- https://en.wikipedia.org/wiki/Translation_Memory_eXchange


- https://www.w3.org/International/questions/qa-scripts.en#which
- https://www.w3.org/International/questions/qa-scripts.en#directions
- https://en.wiktionary.org/wiki/dominium#Latin


- https://conferences.unite.un.org/uncorpus
  - https://www.un.org/sg/en/multilingualism/index.shtml


# Spreadsheet formulas


```sql
--- @see https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit?pli=1#gid=355011653

--- Cria o #item +id baseado nos campos #item +type +lat_regnum, +lat_divisionem, +lat_classem ...
=IFERROR(JOIN("_",FILTER(D20:J20, NOT(D20:J20 = ""))),"")

--- TODO: implementar filtro que gera hiperlink caso tenha Wikidata e/ou link
---      de referencia. A seguir tem um rascunho

=HYPERLINK(IFERROR(CONCAT("https://www.wikidata.org/wiki/", K28), ""),JOIN("_",FILTER(D28:J28, NOT(D28:J28 = ""))))


=IF(ISBLANK(C20), IF(ISBLANK(D20), "", "D20"), "C20")

--- Agora exbibe os textos, mas sem hiperlink ainda
=IF(ISBLANK(C20), IF(ISBLANK(D20), "", INDEX(SPLIT(D20, "|"), 0, 1)), "C20")

--- Agora com links, parte 1 (quebra urls, mas nao wikidata ainda)
=IF(ISBLANK(C20), IF(ISBLANK(D20), "", HYPERLINK(INDEX(SPLIT(D20, "|"), 0, 1), "[(ℹ️)]")), "C20")


--- Agora com links, parte 2, mas sem "[(ℹ️)]" no wikidata
=IF(ISBLANK(C20), IF(ISBLANK(D20), "", HYPERLINK(INDEX(SPLIT(D20, "|"), 0, 1), "[(ℹ️)]")), CONCAT("https://www.wikidata.org/wiki/", C20))

--- Agora com links, parte 3
=IF(ISBLANK(C20), IF(ISBLANK(D20), "", HYPERLINK(INDEX(SPLIT(D20, "|"), 0, 1), "[(ℹ️)]")), HYPERLINK(CONCAT("https://www.wikidata.org/wiki/", C20), "[(ℹ️)]")
```
- `ISBLANK(A2)`
  - https://support.google.com/docs/answer/3093290
- `SPLIT("1,2,3"; ",")`
  - https://support.google.com/docs/answer/3094136
- `HIPERLINK(url; [rotulo_do_link])`
  - https://support.google.com/docs/answer/3093313


## Copy conditional formating
- https://spreadsheetpoint.com/copy-conditional-formatting-in-google-sheets/
