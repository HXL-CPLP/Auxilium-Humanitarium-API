# @ARCHĪVUM         _plugins/hapi/paginam/tm.rb
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

require 'json'

#
# Trivia:
# - 'Hapi'
#   - https://hapi.etica.ai/
# - 'trānslātiōnem'
#   - https://en.wiktionary.org/wiki/translatio#Latin
# - 'memoriam'
#   - https://en.wiktionary.org/wiki/memoria#Latin
module Hapi
  # TranslationemMemoriamGenerator is (TODO: document)
  class TranslationemMemoriamGenerator < Jekyll::Generator
    safe true

    def generate(site)
      @debug_all = false

      # unless site.data['l10n']['schemaml10n'] && site.data['l10n']['referensl10n']
      #   puts "\n\n\t[🔎ℹ️ #{self.class.name}:#{__LINE__}] requīrendum: 'bundle exec jekyll build' !!!"
      #   return nil
      # end

      # puts site.data.keys

      # schemam_collectionem = site.data['l10n']['schemaml10n']
      tm_collectionem = site.data['translationem-memoriam']

      tm_collectionem.each do |item|
        site.pages << TranslationemMemoriamPaginam.new(site, item)
      end
    end
  end

  # require_relative './hapi/commune_paginam'
  # require_relative './hapi/paginam/commune'
  require_relative './commune'

  # _[eng] Subclass of `Jekyll::Page` with custom method definitions. [eng]_
  # _[eng] Subclasse de `Hapi::HapiCommunePaginam` com customizações nos métodos [eng]_
  class TranslationemMemoriamPaginam < Hapi::HapiPaginamCommune
    attr_accessor :datum, :gid, :uid, :xdefallo, :xdefallo_est, :experimentum_est

    # Attributes for Liquid templates
    ATTRIBUTES_FOR_LIQUID = %w[
      alternativum
      archivum_extensionem
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
                   'xtm'
                 else
                   'non-existendum-est'
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
      tm_collectionem = Hapi::HSD.tm_paginam?
      # puts tm_collectionem.inspect
      tm_collectionem&.each do |tm|
        # puts api.class
        resultatum.append(tm) if @xdefallo == tm.xdefallo
      end

      resultatum
    end

    def html_body_class
      [
        'paginam-typum-tm',
        "paginam-linguam-#{@datum['linguam']}"
      ]
    end

    def tags
      # @see Utilitatem.tags_de_api
      [
        'tm',
        "tm-linguam-#{linguam}",
        "tm-trivium-#{trivium}"
      ]
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
