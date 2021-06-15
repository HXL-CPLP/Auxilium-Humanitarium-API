# @ARCHĪVUM         _plugins/jekyll_hapi_schemam.rb
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
  # HapiSchemamGenerator is (TODO: document)
  class HapiSchemamGenerator < Jekyll::Generator
    safe true

    def generate(site)
      @debug_all = false

      # unless site.data['l10n']['apil10n'] && site.data['l10n']['referensl10n']
      #   puts "\n\n\t[🔎ℹ️ #{self.class.name}:#{__LINE__}] requīrendum: 'bundle exec jekyll build' !!!"
      #   return nil
      # end

      unless site.data['l10n']['schemaml10n'] && site.data['l10n']['referensl10n']
        puts "\n\n\t[🔎ℹ️ #{self.class.name}:#{__LINE__}] requīrendum: 'bundle exec jekyll build' !!!"
        return nil
      end

      # # @apis = Utilitatem.expandendum_api_datum(site.data['api'], site.data['referens'])
      # @apis = Utilitatem.expandendum_api_datum(
      #   site.data['l10n']['apil10n'],
      #   site.data['l10n']['referensl10n']
      # )
      # # puts 'oooooi'
      # # _[eng] We override site.data.api [eng]_
      # # _[por] Sobrescrevemos o site.data.api [por]_
      # site.data['api'] = @apis

      # site.data['api'].each do |api_datum|
      #   @debug_est = @debug_all or api_datum['debug']
      #   site.pages << SchemamPaginam.new(site, api_datum, @debug_est)
      # end
      schemam_collectionem = site.data['l10n']['schemaml10n']

      schemam_collectionem.each do |item|
        unless item['__translationem'].nil? # rubocop:disable  Style/SafeNavigation
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
      # TODO: _[eng-Latn] Finish the MVP of ArchivumSimplex [eng-Latn]_

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

  # _[eng] Subclass of `Jekyll::Page` with custom method definitions. [eng]_
  # _[eng] Subclasse de `Jekyll::Page` com customizações nos métodos [eng]_
  class SchemamPaginam < Jekyll::Page
    attr_accessor :datum, :gid, :uid, :xdefallo, :xdefallo_est

    # Attributes for Liquid templates
    ATTRIBUTES_FOR_LIQUID = %w[
      alternativum
      content
      dir
      gid
      html_body_class
      hreflang
      linguam
      namen
      opus_in_progressu
      path
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
      @opus_in_progressu = !!api_datum['opus_in_progressu'] # rubocop:disable Style/DoubleNegation

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

    # Trivia
    # - 'digitum'
    #   - https://en.wiktionary.org/wiki/digitus#Latin
    # - 'signātūrum'
    #   - https://en.wiktionary.org/wiki/signaturus#Latin
    def digitum_signaturum
      Utilitatem.digitum_premendum(relative_path)
    end

    # Trivia
    # - 'gid'
    #   - https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
    def gid_est?(gid)
      @gid == gid
    end

    def html_body_class
      [
        'paginam-typum-schemam',
        "paginam-linguam-#{@datum['linguam']}"
      ]
    end

    def hreflang
      return 'x-default' if xdefallo_est

      # TODO: _[eng] maybe initialize this once instead of recalculate [eng]_

      site_data = Hapi::HSD.data?

      Hapi::Utilitatem.linguam_to_html_lang(linguam, site_data['referens'])
    end

    def keys
      ATTRIBUTES_FOR_LIQUID
    end

    def linguam
      @datum['linguam']
    end

    # def openapi_filum
    #   # @datum['jekyll-page']['openapi_filum2'] || '<mark lang="la">Nulla openapi filum. Adiuva me 🥺</mark>'
    #   @datum['jekyll-page']['openapi_filum2']
    # end

    def opus_in_progressu
      !!@opus_in_progressu
    end

    # TODO: remove obsolete parts
    def summarius
      unless @datum['jekyll-page'].nil?
        @summarius || @datum['jekyll-page']['summarius'] || '<mark lang="la">Nulla summarius. Adiuva me 🥺</mark>'
      end
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
    def titulum
      @titulum || @namen || @title || @datum['summarius']
    end

    def namen
      @titulum || @namen || @title
    end

    # Trivia
    # - 'trivium'
    #   - https://en.wiktionary.org/wiki/trivium#Latin
    # - 'xdefallo'
    #   - https://developers.google.com/search/blog/2013/04/x-default-hreflang-for-international-pages
    def trivium
      Hapi::Utilitatem.digitum_premendum(@xdefallo)
      # @datum
    end

    # _[eng] Returns the object as a debug String [eng]_
    # @see https://github.com/jekyll/jekyll/blob/master/lib/jekyll/collection.rb
    # @see https://github.com/jekyll/jekyll/blob/master/lib/jekyll/page.rb
    # # .
    # def inspect
    #   # puts 'datum'
    #   # puts @datum

    #   # "#<#{self.class} @relative_path=#{relative_path.inspect} xdefallo=#{@trivum}>"
    #   "#<#{self.class} @uid=#{@uid} xdefallo=#{@xdefallo}>"
    # end

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

    attr_reader :xdefallo

    # _[eng] Is this an xdefallo API? [eng]_
    # _[por] Esta é uma API xdefallo? [por]_
    # Trivia
    # - 'trivium'
    #   - https://en.wiktionary.org/wiki/trivium#Latin
    # - 'xdefallo'
    #   - https://developers.google.com/search/blog/2013/04/x-default-hreflang-for-international-pages
    attr_reader :xdefallo_est
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
