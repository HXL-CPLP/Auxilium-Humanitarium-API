#!/usr/bin/env python3
# ==============================================================================
#
#          FILE:  hxltm2xliff
#
#         USAGE:  hxltm2xliff schemam-un-htcds.tm.hxl.csv schemam-un-htcds.xliff
#                 cat schemam-un-htcds.tm.hxl.csv | hxltm2xliff > schemam-un-htcds.xliff
#
#   DESCRIPTION:  _[eng-Latn] hxltm2xliff is an working draft of a tool to
#                             convert prototype of translation memory stored
#                             with HXL to XLIFF v2.1
#                 [eng-Latn]_
#                 @see http://docs.oasis-open.org/xliff/xliff-core/v2.1/os/xliff-core-v2.1-os.html
#                 @see https://www.gala-global.org/lisa-oscar-standards
#                 @see https://github.com/HXL-CPLP/forum/issues/58
#                 @see https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/issues/16
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  - python3
#                     - libhxl (@see https://pypi.org/project/libhxl/)
#                     - (disabled) hug (https://github.com/hugapi/hug/)
#                     - your-extra-python-lib-here
#                 - your-non-python-dependency-here
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v0.7
#       CREATED: 2021-06-27 19:50 UTC v0.5, de github.com/EticaAI
#                       /HXL-Data-Science-file-formats/blob/main/bin/hxl2example
#      REVISION:  2021-06-27 21:16 UTC v0.6 de hxl2tab
#      REVISION:  2021-06-27 23:53 UTC v0.7 --archivum-extensionem=.csv
# ==============================================================================

# Tests
# Exemplos: https://github.com/oasis-tcs/xliff-xliff-22/blob/master/xliff-21/test-suite/core/valid/allExtensions.xlf
# ./_systema/programma/hxltm2xliff.py --help
# ./_systema/programma/hxltm2xliff.py _hxltm/schemam-un-htcds.tm.hxl.csv
# ./_systema/programma/hxltm2xliff.py _hxltm/schemam-un-htcds-5items.tm.hxl.csv
# ./_systema/programma/hxltm2xliff.py _hxltm/schemam-un-htcds.tm.hxl.csv --fontem-linguam=eng-Latn
# ./_systema/programma/hxltm2xliff.py _hxltm/schemam-un-htcds-5items.tm.hxl.csv --fontem-linguam=eng-Latn --archivum-extensionem=.tmx
# python3 -m doctest ./_systema/programma/hxltm2xliff.py

__VERSION__ = "v0.7"

import sys
import os
import logging
import argparse

# @see https://github.com/HXLStandard/libhxl-python
#    pip3 install libhxl --upgrade
# Do not import hxl, to avoid circular imports
import hxl.converters
import hxl.filters
import hxl.io

import csv
import tempfile

# @see https://github.com/hugapi/hug
#     pip3 install hug --upgrade
# import hug

# In Python2, sys.stdin is a byte stream; in Python3, it's a text stream
STDIN = sys.stdin.buffer

# for line in hxl.data(sys.stdin).gen_csv():
# for line in hxl.data('_hxltm/schemam-un-htcds-5items.tm.hxl.csv', allow_local=True).gen_csv():
# for line in hxl.data('_hxltm/schemam-un-htcds-5items.tm.hxl.csv', allow_local=True).with_rows('#sector=WASH').gen_csv():
# for line in hxl.data('_hxltm/schemam-un-htcds-5items.tm.hxl.csv', allow_local=True).without_columns('#meta').gen_csv():
#     print('ooooi', line)


class HXLTM2XLIFF:
    """
    _[eng-Latn] hxltm2xliff is an working draft of a tool to
                convert prototype of translation memory stored with HXL to
                XLIFF v2.1
    [eng-Latn]_
    """

    def __init__(self):
        """
        _[eng-Latn] Constructs all the necessary attributes for the
                    HXLTM2XLIFF object.
        [eng-Latn]_
        """
        self.hxlhelper = None
        self.args = None

        # Posix exit codes
        self.EXIT_OK = 0
        self.EXIT_ERROR = 1
        self.EXIT_SYNTAX = 2

        self.original_outfile = None
        self.original_outfile_is_stdout = True

    def make_args_hxl2example(self):

        self.hxlhelper = HXLUtils()
        parser = self.hxlhelper.make_args(
            #     description=("""
            # _[eng-Latn] hxltm2xliff is an working draft of a tool to
            #             convert prototype of translation memory stored with HXL to
            #             XLIFF v2.1
            # [eng-Latn]_
            # """)
            description=(
                "_[eng-Latn] hxltm2xliff " + __VERSION__ + " " +
                "is an working draft of a tool to " +
                "convert prototype of translation memory stored with HXL to " +
                "XLIFF v2.1 [eng-Latn]_"
            )
        )

        parser.add_argument(
            '--archivum-extensionem',
            help='File extension. .xlf, .csv or .tmx',
            action='store',
            default='.xlf',
            nargs='?'
        )

        parser.add_argument(
            '--fontem-linguam',
            help='Source language (use if not autodetected). ' +
            'Must be like {ISO 639-3}-{ISO 15924}. Example: por-Latn',
            action='store',
            default='lat-Latn',
            nargs='?'
        )

        parser.add_argument(
            '--objectivum-linguam',
            help='XLiff Target language (use if not autodetected). ' +
            'Must be like {ISO 639-3}-{ISO 15924}. Example: eng-Latn',
            action='store',
            default='arb-Arab',
            nargs='?'
        )

        parser.add_argument(
            "--hxlmeta",
            help="Don't print output, just the hxlmeta of the input",
            action='store_const',
            const=True,
            metavar='hxlmeta',
            default=False
        )

        self.args = parser.parse_args()
        return self.args

    def execute_cli(self, args,
                    stdin=STDIN, stdout=sys.stdout, stderr=sys.stderr):
        """
        The execute_cli is the main entrypoint of HXLTM2XLIFF. When
        called will convert the HXL source to example format.
        """

        # # NOTE: the next lines, in fact, only generate an csv outut. So you
        # #       can use as starting point.
        # with self.hxlhelper.make_source(args, stdin) as source, \
        #         self.hxlhelper.make_output(args, stdout) as output:
        #     hxl.io.write_hxl(output.output, source,
        #                      show_tags=not args.strip_tags)

        # return self.EXIT_OK

        # If the user specified an output file, we will save on
        # self.original_outfile. The args.outfile will be used for temporary
        # output
        if args.outfile:
            self.original_outfile = args.outfile
            self.original_outfile_is_stdout = False

        try:
            temp = tempfile.NamedTemporaryFile()
            temp_csv4xliff = tempfile.NamedTemporaryFile()
            args.outfile = temp.name

            # print(temp_csv4xliff)
            # print(temp_csv4xliff.name)

            with self.hxlhelper.make_source(args, stdin) as source, \
                    self.hxlhelper.make_output(args, stdout) as output:
                # Save the HXL TM locally. It will be used by either hxltm2csv
                # or hxltm2csv + hxltm2xliff
                hxl.io.write_hxl(output.output, source,
                                 show_tags=not args.strip_tags)

            if args.hxlmeta:
                print('TODO: hxlmeta')
                # print('output.output', output.output)
                # print('source', source)
                # # print('source.columns', source.headers())
                # hxlmeta = HXLMeta(local_hxl_file=output.output.name)
                # hxlmeta.debuginfo()
            elif args.archivum_extensionem == '.csv':
                # print('CSV!')
                self.hxltm2csv(args.outfile, self.original_outfile,
                               self.original_outfile_is_stdout, args)
            elif args.archivum_extensionem == '.tmx':
                # print('tmx!')
                self.hxltm2tmx(args.outfile, self.original_outfile,
                               self.original_outfile_is_stdout, args)
            else:
                # self.hxl2tab(args.outfile, self.original_outfile,
                #              self.original_outfile_is_stdout, args)

                self.hxltm2csv(args.outfile, temp_csv4xliff.name,
                               False, args)
                self.hxltm2xliff(temp_csv4xliff.name, self.original_outfile,
                                 self.original_outfile_is_stdout, args)

        finally:
            temp.close()
            temp_csv4xliff.close()

        return self.EXIT_OK

    def hxltm2csv(self, hxlated_input, tab_output, is_stdout, args):
        """
        hxltm2csv pre-process the initial HXL TM on a intermediate format that
        can be used alone or as requisite of the hxltm2xliff exporter
        """

        with open(hxlated_input, 'r') as csv_file:
            csv_reader = csv.reader(csv_file)

            # TODO: fix problem if input data already only have HXL hashtags
            #       but no extra headings (Emerson Rocha, 2021-06-28 01:27 UTC)

            # Hotfix: skip first non-HXL header. Ideally I think the already
            # exported HXlated file should already save without headers.
            next(csv_reader)
            header_original = next(csv_reader)
            header_new = self.hxltm2csv_header(
                header_original,
                fontem_linguam=args.fontem_linguam,
                objectivum_linguam=args.objectivum_linguam,
            )

            if is_stdout:
                # txt_writer = csv.writer(sys.stdout, delimiter='\t')
                txt_writer = csv.writer(sys.stdout)
                txt_writer.writerow(header_new)
                for line in csv_reader:
                    txt_writer.writerow(line)
            else:

                tab_output_cleanup = open(tab_output, 'w')
                tab_output_cleanup.truncate()
                tab_output_cleanup.close()

                with open(tab_output, 'a') as new_txt:
                    # txt_writer = csv.writer(new_txt, delimiter='\t')
                    txt_writer = csv.writer(new_txt)
                    txt_writer.writerow(header_new)
                    for line in csv_reader:
                        txt_writer.writerow(line)

    def hxl2tab(self, hxlated_input, tab_output, is_stdout, args):
        """
        hxl2tab is  is the main method to de facto make the conversion.
        """

        with open(hxlated_input, 'r') as csv_file:
            csv_reader = csv.reader(csv_file)

            # Hotfix: skip first non-HXL header. Ideally I think the already
            # exported HXlated file should already save without headers.
            next(csv_reader)
            header_original = next(csv_reader)
            header_new = self.hxltm2csv_header(
                header_original,
                fontem_linguam=args.fontem_linguam,
                objectivum_linguam=args.objectivum_linguam,
            )

            if is_stdout:
                txt_writer = csv.writer(sys.stdout, delimiter='\t')
                txt_writer.writerow(header_new)
                for line in csv_reader:
                    txt_writer.writerow(line)
            else:

                tab_output_cleanup = open(tab_output, 'w')
                tab_output_cleanup.truncate()
                tab_output_cleanup.close()

                with open(tab_output, 'a') as new_txt:
                    txt_writer = csv.writer(new_txt, delimiter='\t')
                    txt_writer.writerow(header_new)
                    for line in csv_reader:
                        txt_writer.writerow(line)

    def hxltm2tmx(self, hxlated_input, tmx_output, is_stdout, args):
        """
        hxltm2tmx is  is the main method to de facto make the conversion.

        TODO: this is a work-in-progress at this moment, 2021-06-28
        @see https://en.wikipedia.org/wiki/Translation_Memory_eXchange
        @see https://www.gala-global.org/lisa-oscar-standards
        @see https://cloud.google.com/translate/automl/docs/prepare
        @see http://xml.coverpages.org/tmxSpec971212.html
        """

        # example of test file https://github.com/rmeertens/tmxtools/blob/master/tests/testfiles/test1.tmx
        # TODO: implement something like internal structure of a object,
        #       maybe csv.DictReader?
        #       @see https://www.geeksforgeeks.org/convert-csv-to-json-using-python/
        #       @see https://docs.python.org/3/library/csv.html#csv.DictReader
        datum = []

        with open(hxlated_input, 'r') as csv_file:
            # TODO: fix problem if input data already only have HXL hashtags
            #       but no extra headings (Emerson Rocha, 2021-06-28 01:27 UTC)

            # Hotfix: skip first non-HXL header. Ideally I think the already
            # exported HXlated file should already save without headers.
            next(csv_file)

            csvReader = csv.DictReader(csv_file)

            # Convert each row into a dictionary
            # and add it to data
            for item in csvReader:

                datum.append(HXLTMUtil.tmx_item_relevan_options(item))

        # @examplum https://cloud.google.com/translate/automl/docs/prepare#translation_memory_exchange_tmx
        # @examplum https://www.gala-global.org/knowledge-center/industry-development/standards/lisa-oscar-standards
        resultatum = []
        resultatum.append("<?xml version='1.0' encoding='utf-8'?>")
        resultatum.append('<!DOCTYPE tmx SYSTEM "tmx14.dtd">')
        resultatum.append('<tmx version="1.4">')
        # @see https://www.gala-global.org/sites/default/files/migrated-pages/docs/tmx14%20%281%29.dtd
        resultatum.append(
            '  <header creationtool="hxltm" creationtoolversion="' + __VERSION__ + '" ' +
            'segtype="sentence" o-tmf="UTF-8" ' +
            'adminlang="en" srclang="en" datatype="PlainText"/>')
        resultatum.append('  <body>')

        num = 0

        for rem in datum:
            num += 1
            # unit_id = rem['#x_xliff+unit+id'] if rem.has_key('#x_xliff+unit+id') else num
            # print(type (rem))
            # print(rem)

            unit_id = rem['#item+id'] if '#item+id' in rem else num
            resultatum.append('      <tu id="' + str(unit_id) + '">')
            if '#item+wikidata+code' in rem:
                resultatum.append(
                    '        <prop type="wikidata">' + rem['#item+wikidata+code'] + '</prop>')

            # TODO: reduzir repetitividade; os valores estao hardcoded. Não ideal.

            if '#item+i_la+i_lat+is_latn' in rem:
                resultatum.append('        <tuv xml:lang="la">')
                resultatum.append(
                    '          <seg>' + rem['#item+i_la+i_lat+is_latn'] + '</seg>')

            if '#item+i_pt+i_por+is_latn' in rem:
                resultatum.append('        <tuv xml:lang="pt">')
                resultatum.append(
                    '          <seg>' + rem['#item+i_pt+i_por+is_latn'] + '</seg>')

                resultatum.append('        </tuv>')
            if '#item+i_en+i_eng+is_latn' in rem:
                resultatum.append('        <tuv xml:lang="en">')
                resultatum.append(
                    '          <seg>' + rem['#item+i_en+i_eng+is_latn'] + '</seg>')
                resultatum.append('        </tuv>')

            resultatum.append('      </tu>')

        resultatum.append('  </body>')
        resultatum.append('</tmx>')

        if is_stdout:
            for ln in resultatum:
                print(ln)
        else:
            tmx_output_cleanup = open(tmx_output, 'w')
            tmx_output_cleanup.truncate()
            tmx_output_cleanup.close()

            with open(tmx_output, 'a') as new_txt:
                for ln in resultatum:
                    new_txt.write(ln + "\n")
                    # print (ln)

    def hxltm2xliff(self, hxlated_input, xliff_output, is_stdout, args):
        """
        hxltm2xliff is  is the main method to de facto make the conversion.

        TODO: this is a work-in-progress at this moment, 2021-06-28
        """

        # TODO: implement something like internal structure of a object,
        #       maybe csv.DictReader?
        #       @see https://www.geeksforgeeks.org/convert-csv-to-json-using-python/
        #       @see https://docs.python.org/3/library/csv.html#csv.DictReader
        datum = []

        with open(hxlated_input, 'r') as csv_file:
            csvReader = csv.DictReader(csv_file)

            # Convert each row into a dictionary
            # and add it to data
            for item in csvReader:

                datum.append(HXLTMUtil.xliff_item_relevant_options(item))

        resultatum = []
        resultatum.append('<?xml version="1.0"?>')
        resultatum.append(
            '<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" version="2.0" srcLang="en" trgLang="fr">')
        resultatum.append('  <file id="f1">')

        num = 0

        for rem in datum:
            num += 1
            # unit_id = rem['#x_xliff+unit+id'] if rem.has_key('#x_xliff+unit+id') else num
            unit_id = rem['#x_xliff+unit+id'] if rem['#x_xliff+unit+id'] else num
            resultatum.append('      <unit id="' + str(unit_id) + '">')

            resultatum.append('        <segment>')

            xsource = HXLTMUtil.xliff_item_xliff_source_key(rem)
            if xsource:
                if not rem[xsource]:
                    resultatum.append(
                        '          <!-- ERROR source ' + unit_id + ', ' + xsource + '-->')
                    print('ERROR:', unit_id, xsource)
                    # continue
                else:
                    resultatum.append('          <source>' +
                                      rem[xsource] + '</source>')

            xtarget = HXLTMUtil.xliff_item_xliff_target_key(rem)
            if xtarget and rem[xtarget]:
                resultatum.append('          <target>' +
                                  rem[xtarget] + '</target>')

            resultatum.append('        </segment>')

            resultatum.append('      </unit>')

        resultatum.append('  </file>')
        resultatum.append('</xliff>')

        if is_stdout:
            for ln in resultatum:
                print(ln)
        else:
            xliff_output_cleanup = open(xliff_output, 'w')
            xliff_output_cleanup.truncate()
            xliff_output_cleanup.close()

            with open(xliff_output, 'a') as new_txt:
                for ln in resultatum:
                    new_txt.write(ln + "\n")
                    # print (ln)

    def hxltm2csv_header(self, hxlated_header, fontem_linguam, objectivum_linguam):
        """
        _[eng-Latn] Convert the Main HXL TM file to a single or source to target
                    XLIFF translation pair
        [eng-Latn]_

#item+id                               -> #x_xliff+unit+id
#meta+archivum                         -> #x_xliff+file
#item+wikidata+code                    -> #x_xliff+unit+note+note_category__wikidata
#meta+wikidata+code                    -> #x_xliff+unit+note+note_category__wikidata
#meta+item+url+list                    -> #x_xliff+unit+notes+note_category__url
#item+type+lat_dominium+list           -> #x_xliff+group+group_0 (We will not implement deeper levels  than 0 now)

    [contextum: XLIFF srcLang]
#item(*)+i_ZZZ+is_ZZZZ                 -> #x_xliff+source+i_ZZZ+is_ZZZZ
#status(*)+i_ZZZ+is_ZZZZ+xliff         -> #meta+x_xliff+segment_source+state+i_ZZZ+is_ZZZZ (XLIFF don't support)
#meta(*)+i_ZZZ+is_ZZZZ                 -> #x_xliff+unit+note+note_category__source
#meta(*)+i_ZZZ+is_ZZZZ+list            -> #x_xliff+unit+notes+note_category__source

    [contextum: XLIFF trgLang]
#item(*)+i_ZZZ+is_ZZZZ                 -> #x_xliff+target+i_ZZZ+is_ZZZZ
#status(*)+i_ZZZ+is_ZZZZ+xliff         -> #x_xliff+segment+state+i_ZZZ+is_ZZZZ
#meta(*)+i_ZZZ+is_ZZZZ                 -> #x_xliff+unit+note+note_category__target
#meta(*)+i_ZZZ+is_ZZZZ+list            -> #x_xliff+unit+notes+note_category__target

        _[eng-Latn] TODO:
- Map XLIFF revisions back MateCat back to HXL TM
  @see http://docs.oasis-open.org/xliff/xliff-core/v2.1/os/xliff-core-v2.1-os.html#revisions
        [eng-Latn]_
        """

        # TODO: improve this block. I'm very sure there is some cleaner way to
        #       do it in a more cleaner way (fititnt, 2021-01-28 08:56 UTC)

        fon_ling = HXLTMUtil.linguam_2_hxlattrs(fontem_linguam)
        fon_bcp47 = HXLTMUtil.bcp47_from_hxlattrs(fontem_linguam)
        obj_ling = HXLTMUtil.linguam_2_hxlattrs(objectivum_linguam)
        obj_bcp47 = HXLTMUtil.bcp47_from_hxlattrs(objectivum_linguam)

        for idx, _ in enumerate(hxlated_header):

            if hxlated_header[idx].startswith('#x_xliff'):
                # Something explicitly was previously defined with #x_xliff
                # So we will intentionally ignore on this step.
                # This could be useful if someone is trying to translate twice
                continue

            elif hxlated_header[idx] == '#item+id':
                hxlated_header[idx] = '#x_xliff+unit+id'
                continue

            elif hxlated_header[idx] == '#meta+archivum':
                hxlated_header[idx] = '#x_xliff+file'
                continue

            elif hxlated_header[idx] == '#meta+item+url+list':
                hxlated_header[idx] = '#x_xliff+unit+notes+note_category__url'
                continue

            elif hxlated_header[idx] == '#item+wikidata+code' or \
                    hxlated_header[idx] == '#meta+wikidata+code':
                hxlated_header[idx] = '#x_xliff+unit+note+note_category__wikidata'
                continue

            elif hxlated_header[idx] == '#item+type+lat_dominium+list':
                hxlated_header[idx] = '#x_xliff+group+group_0'
                continue

            elif hxlated_header[idx].startswith('#item'):

                if hxlated_header[idx].find(fon_ling) > -1 and \
                        not hxlated_header[idx].find('+list') > -1:
                    hxlated_header[idx] = '#x_xliff+source' + \
                        fon_bcp47 + fon_ling
                elif hxlated_header[idx].find(obj_ling) > -1 and \
                        not hxlated_header[idx].find('+list') > -1:
                    hxlated_header[idx] = '#x_xliff+target' + obj_ling

                continue

            elif hxlated_header[idx].startswith('#status'):
                if hxlated_header[idx].find(fon_ling) > -1 and \
                        not hxlated_header[idx].find('+list') > -1:
                    # TODO: maybe just ignore source state? XLIFF do not
                    #       support translations from source languages that
                    #       are not ideally ready yet
                    if hxlated_header[idx].find('+xliff') > -1:
                        hxlated_header[idx] = '#x_xliff+segment+state' + \
                            fon_bcp47 + fon_ling
                elif hxlated_header[idx].find(obj_ling) > -1 and \
                        not hxlated_header[idx].find('+list') > -1:
                    if hxlated_header[idx].find('+xliff') > -1:
                        hxlated_header[idx] = '#x_xliff+segment+state' + \
                            obj_bcp47 + obj_ling
                if hxlated_header[idx] != '#status':
                    print('#status ERROR?, FIX ME', hxlated_header[idx])
                continue

            elif hxlated_header[idx].startswith('#meta'):
                # @see http://docs.oasis-open.org/xliff/xliff-core/v2.1/os
                #      /xliff-core-v2.1-os.html#category

                if hxlated_header[idx].find(fon_ling) > -1:
                    if hxlated_header[idx].find('+list') > -1:
                        hxlated_header[idx] = '#x_xliff+unit+notes+note_category__source'
                    else:
                        hxlated_header[idx] = '#x_xliff+unit+note+note_category__source'
                    continue

                if hxlated_header[idx].find(obj_ling) > -1:
                    if hxlated_header[idx].find('+list') > -1:
                        hxlated_header[idx] = '#x_xliff+unit+notes+note_category__target'
                    else:
                        hxlated_header[idx] = '#x_xliff+unit+note+note_category__target'
                    continue

                # We will ignore other #metas
                continue

        return hxlated_header


class HXLTMUtil:

    def bcp47_from_hxlattrs(hashtag):
        """From a typical HXLTM hashtag, return only the bcp47 language code
        without require a complex table equivalence.

        Example:
            >>> HXLTMUtil.bcp47_from_hxlattrs('#item+i_ar+i_arb+is_arab')
            'ar'
            >>> HXLTMUtil.bcp47_from_hxlattrs('#item+i_arb+is_arab')
            ''

        Args:
            linguam ([String]): A linguam code

        Returns:
            [String]: HXL Attributes
        """
        if hashtag:
            parts = hashtag.lower().split('+i_')
            for k in parts:
                if len(k) == 2:
                    return k

        return ''

    # def hxlattrlangs_list_from_item(item):
    #     result = []

    # def hxlattrlangs_list_from_item(item):
    #     result = []

    #     for k in item:
    #         if k.startswith('#x_xliff'):
    #             if item[k] == '∅':
    #                 item_neo[k] = None
    #             else:
    #                 item_neo[k] = item[k]

    def iso6393_from_hxlattrs(hashtag):
        """From a typical HXLTM hashtag, return only the ISO 639-3 language code
        without require a complex table equivalence.

        Example:
            >>> HXLTMUtil.iso6393_from_hxlattrs('#item+i_ar+i_arb+is_arab')
            'arb'
            >>> HXLTMUtil.iso6393_from_hxlattrs('#item+i_ar')
            ''

        Args:
            hashtag ([String]): A hashtag string

        Returns:
            [String]: HXL Attributes
        """
        if hashtag:
            parts = hashtag.lower().split('+i_')
            # '#item+i_ar+i_arb+is_arab' => ['#item', 'ar', 'arb+is_arab']
            # print(parts)
            for k in parts:
                if len(k) == 3:
                    return k
                if len(k) == 11 and k.find('+is_') > -1:
                    return k.split('+is_')[0]

        return ''

    def iso115924_from_hxlattrs(hashtag):
        """From a typical HXLTM hashtag, return only the ISO 115924
        writting system without require a complex table equivalence.

        Example:
            >>> HXLTMUtil.iso115924_from_hxlattrs('#item+i_ar+i_arb+is_arab')
            'arab'
            >>> HXLTMUtil.iso115924_from_hxlattrs('#item+i_ar')
            ''

        Args:
            hashtag ([String]): A linguam code

        Returns:
            [String]: HXL Attributes
        """
        if hashtag:
            parts = hashtag.lower().split('+')
            # '#item+i_ar+i_arb+is_arab' => ['#item', 'i_ar', 'i_arb', 'is_arab']
            # print(parts)
            for k in parts:
                if k.startswith('is_'):
                    return k.replace('is_', '')

        return ''

    def item_linguam_keys_grouped(item):
        """From a item with several non-grouped keys, return list of grouped
        results per different language

        Example:
            >  >> item = {'#item+i_pt+i_por+is_latn': '','#item+i_pt+i_por+is_latn+alt+list': '', '#meta+item+i_pt+i_por+is_latn': ''}
            >  >> HXLTMUtil.item_linguam_keys_grouped(item)
            'arab'
            >  >> HXLTMUtil.item_linguam_keys_grouped('#item+i_ar')
            ''

        Args:
            hashtag ([String]): A linguam code

        Returns:
            [String]: HXL Attributes
        """

        print(item)
        alllangs = set()
        for k in item:
            iso6393 = HXLTMUtil.iso6393_from_hxlattrs(k)
            if iso6393:
                alllangs.add(iso6393)

        # TODO: finish item_linguam_keys_grouped. Maybe with hxl.model.TagPattern?
        #       @see https://github.com/HXLStandard/libhxl-python/blob/main/hxl/model.py#L29
        return ''

    def linguam_2_hxlattrs(linguam):
        """linguam_2_hxlattrs

        Example:
            >>> HXLTMUtil.linguam_2_hxlattrs('por-Latn')
            '+i_por+is_latn'
            >>> HXLTMUtil.linguam_2_hxlattrs('arb-Arab')
            '+i_arb+is_arab'

        Args:
            linguam ([String]): A linguam code

        Returns:
            [String]: HXL Attributes
        """
        iso6393, iso115924 = list(linguam.lower().split('-'))
        return '+i_' + iso6393 + '+is_' + iso115924

    def xliff_item_relevant_options(item):
        """From an dict (python object) return only keys that start with
        #x_xliff

        Args:
            item ([Dict]): An non-filtered dict (python object) represent a row

        Returns:
            [Dict]: A filtered object. ∅ is replaced by python None
        """
        item_neo = {}

        for k in item:
            if k.startswith('#x_xliff'):
                if item[k] == '∅':
                    item_neo[k] = None
                else:
                    item_neo[k] = item[k]

        return item_neo

    def tmx_item_relevan_options(item):
        return item
        # item_neo = {}

        # for k in item:
        #     if k.startswith('#x_xliff'):
        #         if item[k] == '∅':
        #             item_neo[k] = None
        #         else:
        #             item_neo[k] = item[k]

        # return item_neo

    def xliff_item_xliff_source_key(item):
        for k in item:
            if k.startswith('#x_xliff+source'):
                return k

        return None

    def xliff_item_xliff_target_key(item):
        for k in item:
            if k.startswith('#x_xliff+target'):
                return k

        return None


class HXLUtils:
    """
    HXLUtils contains functions from the Console scripts of libhxl-python
    (HXLStandard/libhxl-python/blob/master/hxl/scripts.py) with few changes
    to be used as class (and have one single place to change).
    Last update on this class was 2021-01-25.

    Author: David Megginson
    License: Public Domain
    """

    def __init__(self):

        self.logger = logging.getLogger(__name__)

        # Posix exit codes
        self.EXIT_OK = 0
        self.EXIT_ERROR = 1
        self.EXIT_SYNTAX = 2

    def make_args(self, description, hxl_output=True):
        """Set up parser with default arguments.
        @param description: usage description to show
        @param hxl_output: if True (default), include options for HXL output.
        @returns: an argument parser, partly set up.
        """
        parser = argparse.ArgumentParser(description=description)
        parser.add_argument(
            'infile',
            help='HXL file to read (if omitted, use standard input).',
            nargs='?'
        )
        if hxl_output:
            parser.add_argument(
                'outfile',
                help='HXL file to write (if omitted, use standard output).',
                nargs='?'
            )
        parser.add_argument(
            '--sheet',
            help='Select sheet from a workbook (1 is first sheet)',
            metavar='number',
            type=int,
            nargs='?'
        )
        parser.add_argument(
            '--selector',
            help='JSONPath expression for starting point in JSON input',
            metavar='path',
            nargs='?'
        )
        parser.add_argument(
            '--http-header',
            help='Custom HTTP header to send with request',
            metavar='header',
            action='append'
        )
        if hxl_output:
            parser.add_argument(
                '--remove-headers',
                help='Strip text headers from the CSV output',
                action='store_const',
                const=True,
                default=False
            )
            parser.add_argument(
                '--strip-tags',
                help='Strip HXL tags from the CSV output',
                action='store_const',
                const=True,
                default=False
            )
        parser.add_argument(
            "--ignore-certs",
            help="Don't verify SSL connections (useful for self-signed)",
            action='store_const',
            const=True,
            default=False
        )
        parser.add_argument(
            '--log',
            help='Set minimum logging level',
            metavar='debug|info|warning|error|critical|none',
            choices=['debug', 'info', 'warning', 'error', 'critical'],
            default='error'
        )
        return parser

    def add_queries_arg(
        self,
        parser,
        help='Apply only to rows matching at least one query.'
    ):
        parser.add_argument(
            '-q',
            '--query',
            help=help,
            metavar='<tagspec><op><value>',
            action='append'
        )
        return parser

    def do_common_args(self, args):
        """Process standard args"""
        logging.basicConfig(
            format='%(levelname)s (%(name)s): %(message)s',
            level=args.log.upper())

    def make_source(self, args, stdin=STDIN):
        """Create a HXL input source."""

        # construct the input object
        input = self.make_input(args, stdin)
        return hxl.io.data(input)

    def make_input(self, args, stdin=sys.stdin, url_or_filename=None):
        """Create an input object"""

        if url_or_filename is None:
            url_or_filename = args.infile

        # sheet index
        sheet_index = args.sheet
        if sheet_index is not None:
            sheet_index -= 1

        # JSONPath selector
        selector = args.selector

        http_headers = self.make_headers(args)

        return hxl.io.make_input(
            url_or_filename or stdin,
            sheet_index=sheet_index,
            selector=selector,
            allow_local=True,  # TODO: consider change this for execute_web
            http_headers=http_headers,
            verify_ssl=(not args.ignore_certs)
        )

    def make_output(self, args, stdout=sys.stdout):
        """Create an output stream."""
        if args.outfile:
            return FileOutput(args.outfile)
        else:
            return StreamOutput(stdout)

    def make_headers(self, args):
        # get custom headers
        header_strings = []
        header = os.environ.get("HXL_HTTP_HEADER")
        if header is not None:
            header_strings.append(header)
        if args.http_header is not None:
            header_strings += args.http_header
        http_headers = {}
        for header in header_strings:
            parts = header.partition(':')
            http_headers[parts[0].strip()] = parts[2].strip()
        return http_headers


class FileOutput(object):
    """
    FileOutput contains is based on libhxl-python with no changes..
    Last update on this class was 2021-01-25.

    Author: David Megginson
    License: Public Domain
    """

    def __init__(self, filename):
        self.output = open(filename, 'w')

    def __enter__(self):
        return self

    def __exit__(self, value, type, traceback):
        self.output.close()


class StreamOutput(object):
    """
    StreamOutput contains is based on libhxl-python with no changes..
    Last update on this class was 2021-01-25.

    Author: David Megginson
    License: Public Domain
    """

    def __init__(self, output):
        self.output = output

    def __enter__(self):
        return self

    def __exit__(self, value, type, traceback):
        pass

    def write(self, s):
        self.output.write(s)


if __name__ == "__main__":

    hxltm2xliff = HXLTM2XLIFF()
    args = hxltm2xliff.make_args_hxl2example()

    hxltm2xliff.execute_cli(args)
