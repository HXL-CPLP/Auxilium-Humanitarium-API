#!/usr/bin/env python3
# ==============================================================================
#
#          FILE:  hxl2example
#
#         USAGE:  hxl2example hxlated-data.hxl my-exported-file.example
#                 cat hxlated-data.hxl | hxl2example > my-exported-file.example
#                 # Via web, in two different terminals, do it
#                     hug -f bin/hxl2example
#                     ngrok http 8000
#
#   DESCRIPTION:  hxl2example is an example script to create other scripts with
#                 some bare minimum command line interface that could work.
#                 With exception of external libraries, the hxl2example is
#                 meant to be somewhat self-contained one-file executable ready
#                 to just be added to the path.
#
#                 Hug API can be used to create an ad-hoc web interface to your
#                 script. This can be both useful if you are using an software
#                 that accepts an URL as data source and you don't want to use
#                 this script to save a file locally.
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
#        AUTHOR:  Your Name <you[at]example.org>
#       COMPANY:  Your Company
#       LICENSE:  Your License here
#       VERSION:  v1.0
#       CREATED:  YYYY-MM-DD hh:mm UTC
#      REVISION:  ---
# ==============================================================================

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

import tempfile

# @see https://github.com/hugapi/hug
#     pip3 install hug --upgrade
# import hug

# In Python2, sys.stdin is a byte stream; in Python3, it's a text stream
STDIN = sys.stdin.buffer


class HXL2Example:
    """
    HXL2Example is a classe to export already HXLated data in the format
    example.
    """

    def __init__(self):
        """
        Constructs all the necessary attributes for the HXL2Example object.
        """
        self.hxlhelper = None
        self.args = None

        # Posix exit codes
        self.EXIT_OK = 0
        self.EXIT_ERROR = 1
        self.EXIT_SYNTAX = 2

    def make_args_hxl2example(self):

        self.hxlhelper = HXLUtils()
        parser = self.hxlhelper.make_args(
            description=("hxl2example is an example script to create other "
                         "scripts with some bare minimum command line "
                         "interfaces that could work to export HXL files to "
                         "other formats."))

        self.args = parser.parse_args()
        return self.args

    def execute_cli(self, args,
                    stdin=STDIN, stdout=sys.stdout, stderr=sys.stderr):
        """
        The execute_cli is the main entrypoint of HXL2Example. When
        called will convert the HXL source to example format.
        """

        # NOTE: the next lines, in fact, only generate an csv outut. So you
        #       can use as starting point.
        with self.hxlhelper.make_source(args, stdin) as source, \
                self.hxlhelper.make_output(args, stdout) as output:
            hxl.io.write_hxl(output.output, source,
                             show_tags=not args.strip_tags)

        return self.EXIT_OK

    def execute_web(self, source_url, stdin=STDIN, stdout=sys.stdout,
                    stderr=sys.stderr, hxlmeta=False):
        """
        The execute_web is the main entrypoint of HXL2Tab when this class is
        called outside command line interface, like the build in HTTP use with
        hug
        """

        # TODO: the execute_web needs to output the tabfile with correct
        #       mimetype, compression, etc
        #       (fititnt, 2021-02-07 15:59 UTC)

        self.hxlhelper = HXLUtils()

        try:
            temp_input = tempfile.NamedTemporaryFile('w')
            temp_output = tempfile.NamedTemporaryFile('w')

            webargs = type('obj', (object,), {
                "infile": source_url,
                "sheet_index": None,
                "selector": None,
                'sheet': None,
                'http_header': None,
                'ignore_certs': False
            })

            with self.hxlhelper.make_source(webargs, stdin) as source:
                for line in source.gen_csv(True, True):
                    temp_input.write(line)

                temp_input.seek(0)
                # self.hxl2tab(temp_input.name, temp_output.name, False)

                result_file = open(temp_input.name, 'r')
                return result_file.read()

        finally:
            temp_input.close()
            temp_output.close()

        return self.EXIT_OK


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

    hxl2example = HXL2Example()
    args = hxl2example.make_args_hxl2example()

    hxl2example.execute_cli(args)


# @hug.format.content_type('text/csv')
# def output_csv(data, response):
#     if isinstance(data, dict) and 'errors' in data:
#         response.content_type = 'application/json'
#         return hug.output_format.json(data)
#     response.content_type = 'text/csv'
#     if hasattr(data, "read"):
#         return data

#     return str(data).encode("utf8")


# @hug.get('/hxl2example.csv', output=output_csv)
# def api_hxl2example(source_url):
#     """hxl2example (@see https://github.com/EticaAI/HXL-Data-Science-file-formats)

#     Example:
#     http://localhost:8000/hxl2example.csv?source_url=https://docs.google.com/spreadsheets/u/1/d/1l7POf1WPfzgJb-ks4JM86akFSvaZOhAUWqafSJsm3Y4/edit#gid=634938833

#     """

#     hxl2example = HXL2Example()

#     return hxl2example.execute_web(source_url)
