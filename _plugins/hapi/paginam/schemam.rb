# @ARCHĪVUM         _plugins/hapi/paginam/schemam.rb
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
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

require 'json'

module Hapi
  # SchemamGenerator is (TODO: document)
  class SchemamGenerator < Jekyll::Generator
    safe true

    def generate(site) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      @debug_all = false

      unless site.data['l10n']['schemaml10n'] && site.data['l10n']['referensl10n']
        puts "\n\n\t[🔎ℹ️ #{self.class.name}:#{__LINE__}] requīrendum: 'bundle exec jekyll build' !!!"
        return nil
      end

      schemam_collectionem = site.data['l10n']['schemaml10n']

      schemam_collectionem.each do |item|
        unless item['__translationem'].nil? # rubocop:disable Style/SafeNavigation
          item['__translationem'].each do |archivum|
            site.pages << ArchivumSimplex.new(site, archivum, item)
            # ArchivumSimplex.new(site, archivum)
          end
        end

        site.pages << SchemamPaginam.new(site, item)
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class ArchivumSimplex < Jekyll::Page
    def initialize(site, archivum, schemam) # rubocop:disable Metrics/MethodLength,Lint/MissingSuper,Metrics/AbcSize
      template = 'archivum-simplex'
      template_ext = '.html'

      @site = site                                         # the current site instance.
      @base = site.source                                  # path to the source directory.
      @dir  = File.dirname(archivum['objectivum'])            # the directory the page will reside in.
      @ext  = File.extname(archivum['objectivum'])            # the extension.
      @basename = File.basename(archivum['objectivum'], '.*') # filename without the extension.
      @name = File.basename(archivum['objectivum'])           # basically @basename + @ext.

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

  require_relative './commune'

  # _[eng] Subclass of `Hapi::HapiCommunePaginam` with custom method definitions. [eng]_
  # _[eng] Subclasse de `Hapi::HapiCommunePaginam` com customizações nos métodos [eng]_
  # class SchemamPaginam < Jekyll::Page
  class SchemamPaginam < Hapi::HapiPaginamCommune
    attr_accessor :datum, :gid, :uid, :experimentum_est

    # Attributes for Liquid templates
    ATTRIBUTES_FOR_LIQUID = %w[
      alternativum
      content
      descriptionem
      experimentum_est
      dir
      gid
      html_body_class
      hreflang
      linguam
      nomen
      opus_in_progressu
      path
      slug
      summarius
      tags
      titulum
      trivium
      uid
      url
      xdefallo
      xdefallo_est
    ].freeze
    # excerpt
    # name

    # rubocop:disable Lint/MissingSuper

    # _[eng] Initialize a new page [eng]_
    # _[por] Inicializa uma nova página [por]_
    #
    # site          - Jekyll site obiectum
    # api_datum     - API Datum
    # debug         - Debug est?
    def initialize(site, api_datum) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      # super()
      @site = site              # the current site instance.
      @base = site.source       # path to the source directory.
      @dir  = "#{api_datum['uid']}/"
      @name = 'index.html'
      # template = api_datum['jekyll-page']['template']

      @xdefallo = api_datum['xdefallo']
      @xdefallo_est = !!api_datum['xdefallo_est'] # rubocop:disable Style/DoubleNegation

      template = if @xdefallo_est
                   'xschemam'
                 else
                   'schemam'
                 end

      @path = if @site.layouts[template].path.end_with? 'html'
                @site.layouts[template].path.dup
              else
                File.join(@site.layouts[template].path, @site.layouts[template].name)
              end

      @datum = api_datum
      @gid = api_datum['gid']
      @uid = api_datum['uid']

      # opus_in_progressu deprecated, Use experimentum_est
      @opus_in_progressu = !!api_datum['opus_in_progressu'] # rubocop:disable Style/DoubleNegation
      @experimentum_est = api_datum['experimentum_est'] ? true : false

      process(name)

      base_path = @site.layouts[template].path
      base_path.slice! @site.layouts[template].name

      # self.read_yaml, rubocop complaints about self.
      read_yaml(base_path, @site.layouts[template].name)

      generate_excerpt if site.config['page_excerpts']

      # _[por] Não estamos usando Jekyll defaults [por]_
      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, type, key)
      end

      # self.data, rubocop complaints about self.
      data['datum'] = api_datum

      Jekyll::Hooks.trigger :pages, :post_init, self
    end
    # rubocop:enable Lint/MissingSuper

    # Trivia
    # - 'alternātīvum'
    #   - https://en.wiktionary.org/wiki/alternativus#Latin
    def alternativum
      # Utilitatem.digitum_premendum(relative_path)
      resultatum = []
      schemam_collectionem = Hapi::HSD.schemam_paginam?
      schemam_collectionem&.each do |schemam|
        # puts api.class
        resultatum.append(schemam) if @xdefallo == schemam.xdefallo
      end

      resultatum
    end

    def html_body_class
      [
        'paginam-typum-schemam',
        "paginam-linguam-#{@datum['linguam']}"
      ]
    end

    def tags
      # @see Utilitatem.tags_de_api
      [
        'schemam',
        "schemam-linguam-#{linguam}",
        "schemam-trivium-#{trivium}"
      ]
    end

    # TODO: remove obsolete parts
    # TODO: Hapi::HapiPaginamCommune.titulum?
    def titulum
      return @datum['titulum'] if @datum['titulum']

      # {% _🗣️ schemam_datum_nomen 🗣️_ %}: {{ schemam.nomen }}
      prefix = Hapi::HSD.l10n_simplex('schemam_datum_nomen', linguam)
      # @titulum || @nomen || @title || @datum['summarius']

      "#{prefix} : #{nomen}"
    end

    # _[eng] Returns the object as a debug String [eng]_
    # @see https://github.com/jekyll/jekyll/blob/master/lib/jekyll/collection.rb
    # @see https://github.com/jekyll/jekyll/blob/master/lib/jekyll/page.rb
    # # .
    def to_s
      # puts 'datum'
      # puts @datum

      # "#<#{self.class} @relative_path=#{relative_path.inspect} xdefallo=#{@trivum}>"
      "#<#{self.class} @uid=#{@uid} xdefallo=#{@xdefallo}>"
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
