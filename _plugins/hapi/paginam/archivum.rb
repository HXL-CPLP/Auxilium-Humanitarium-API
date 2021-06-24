# @ARCHĪVUM         _plugins/hapi/paginam/archivum.rb
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137

# require 'json'

#
# Trivia:
# - 'Hapi'
#   - https://hapi.etica.ai/
# - 'schēmam'
#   - https://en.wiktionary.org/wiki/schema#Latin
# - 'datum'
#   - https://en.wiktionary.org/wiki/datum#Latin
# - 'pāginam'
#   - https://en.wiktionary.org/wiki/pagina#Latin
# - ūtilitātem
#   - https://en.wiktionary.org/wiki/utilitas#Latin
# - 'expandendum'
#   - https://en.wiktionary.org/wiki/expando#Latin
# frozen_string_literal: true
module Hapi
  # Subclass of `Jekyll::Page` with custom method definitions.
  class ArchivumSimplex < Jekyll::Page
    attr_accessor :archivum_extensionem

    # Attributes for Liquid templates
    ATTRIBUTES_FOR_LIQUID = %w[
      archivum_extensionem
      content
      dir
      excerpt
      name
      path
      url
    ].freeze

    def initialize(site, archivum, schemam) # rubocop:disable Metrics/MethodLength,Lint/MissingSuper,Metrics/AbcSize
      template = 'archivum-simplex'
      template_ext = '.html'

      @site = site                                         # the current site instance.
      @base = site.source                                  # path to the source directory.
      @dir  = File.dirname(archivum['objectivum'])            # the directory the page will reside in.
      @ext  = File.extname(archivum['objectivum'])            # the extension.
      @basename = File.basename(archivum['objectivum'], '.*') # filename without the extension.
      @name = File.basename(archivum['objectivum'])           # basically @basename + @ext.

      @archivum_extensionem = @ext
      # puts @ext

      template_textum = File.read(Jekyll::PathManager.join(@base, archivum['fontem']))

      base_path = @site.layouts[template].path
      base_path.slice! @site.layouts[template].name

      read_yaml(base_path, "#{template}#{template_ext}")

      # _[por] Não estamos usando Jekyll defaults [por]_
      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, type, key)
      end

      # @archivum_fundationem = template_textum
      @content = template_textum
      # @linguam = schemam['linguam']
      data['linguam'] = schemam['linguam']

      # data['archivum_fundationem'] = template_textum

      process(@name)

      Jekyll::Hooks.trigger :pages, :post_init, self
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
