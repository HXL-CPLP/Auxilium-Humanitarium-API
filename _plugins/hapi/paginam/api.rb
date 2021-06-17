# ARCHĪVUM:           _plugins/hapi/paginam/api.rb
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

require 'json'

# Trivia:
# - 'datum'
#   - https://en.wiktionary.org/wiki/datum#Latin
# - 'pāginam'
#   - https://en.wiktionary.org/wiki/pagina#Latin
# - ūtilitātem
#   - https://en.wiktionary.org/wiki/utilitas#Latin
# - 'expandendum'
#   - https://en.wiktionary.org/wiki/expando#Latin
module Hapi
  # HapiApiGenerator is (TODO: document)
  class HapiApiGenerator < Jekyll::Generator
    safe true

    def generate(site) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      @debug_all = false

      unless site.data['l10n']['apil10n'] && site.data['l10n']['referensl10n']
        puts "\n\n\t[🔎ℹ️ #{self.class.name}:#{__LINE__}] requīrendum: 'bundle exec jekyll build' !!!"
        return nil
      end

      # @apis = Utilitatem.expandendum_api_datum(site.data['api'], site.data['referens'])
      @apis = Utilitatem.expandendum_api_datum(
        site.data['l10n']['apil10n'],
        site.data['l10n']['referensl10n']
      )
      # _[eng] We override site.data.api [eng]_
      # _[por] Sobrescrevemos o site.data.api [por]_
      site.data['api'] = @apis

      site.data['api'].each do |api_datum|
        @debug_est = @debug_all or api_datum['debug']
        site.pages << ApiPaginam.new(site, api_datum, @debug_est)
      end
    end
  end

  # require_relative './hapi/commune_paginam'
  # require_relative './hapi/paginam/commune'
  require_relative './commune'

  # _[eng] Subclass of `Jekyll::Page` with custom method definitions. [eng]_
  # _[eng] Subclasse de `Jekyll::Page` com customizações nos métodos [eng]_
  # class ApiPaginam < Jekyll::Page
  class ApiPaginam < Hapi::HapiPaginamCommune
    attr_accessor :datum, :gid, :uid, :xdefallo, :xdefallo_est, :experimentum_est

    # Attributes for Liquid templates
    ATTRIBUTES_FOR_LIQUID = %w[
      alternativum
      experimentum_est
      gid
      uid
      titulum
      html_body_class
      nomen
      summarius
      opus_in_progressu
      xdefallo
      xdefallo_est
      content
      dir
      path
      url
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
    def initialize(site, api_datum, _debug) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      # super()
      @site = site              # the current site instance.
      @base = site.source       # path to the source directory.
      # @dir  = api_datum['dir']  # the directory the page will reside in.
      # @name = api_datum['lid']
      # @dir  = api_datum['dir'] + '/' + api_datum['lid'] + '/'
      @dir  = "#{api_datum['dir']}/#{api_datum['lid']}/"
      # @name = 'index.html'
      @name = 'index.html'
      template = api_datum['jekyll-page']['template']

      @path = if @site.layouts[template].path.end_with? 'html'
                @site.layouts[template].path.dup
              else
                File.join(@site.layouts[template].path, @site.layouts[template].name)
              end

      @datum = api_datum
      @gid = api_datum['gid']
      @uid = api_datum['uid']
      @xdefallo = api_datum['xdefallo']
      @xdefallo_est = !!api_datum['xdefallo_est']
      @opus_in_progressu = !!api_datum['opus_in_progressu'] # rubocop:disable Style/DoubleNegation
      @experimentum_est = api_datum['experimentum_est'] ? true : false
      # puts api_datum['opus_in_progressu']
      # puts api_datum
      # @trivum = 'teste'

      #  Hapi::HapiApiGenerator.quod_datum_api_liquify(site, '/data/api.json')
      # HapiApiGenerator.quod_datum_api_liquify(site, '/data/api.json')

      # site.pages.each do |paginam|
      #   puts JSON.parse(paginam.content) if paginam.url == '/data/api.json'
      # end

      process(name)
      # read_yaml(PathManager.join(base, dir), name)

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
      data.merge!(api_datum['jekyll-page'])

      Jekyll::Hooks.trigger :pages, :post_init, self
    end
    # rubocop:enable Lint/MissingSuper

    # Trivia
    # - 'alternātīvum'
    #   - https://en.wiktionary.org/wiki/alternativus#Latin
    def alternativum
      # Utilitatem.digitum_premendum(relative_path)
      resultatum = []
      apis = Hapi::HSD.api_paginam?
      apis&.each do |api|
        # puts api.class
        resultatum.append(api) if @xdefallo == api.xdefallo
      end

      resultatum
    end

    # # Trivia
    # # - 'digitum'
    # #   - https://en.wiktionary.org/wiki/digitus#Latin
    # # - 'signātūrum'
    # #   - https://en.wiktionary.org/wiki/signaturus#Latin
    # def digitum_signaturum
    #   Utilitatem.digitum_premendum(relative_path)
    # end

    # # Trivia
    # # - 'gid'
    # #   - https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
    # def gid_est?(gid)
    #   @gid == gid
    # end

    def html_body_class
      [
        'paginam-typum-api',
        "paginam-linguam-#{@datum['linguam']}"
      ]
    end

    # def keys
    #   ATTRIBUTES_FOR_LIQUID
    # end

    def openapi_filum
      # @datum['jekyll-page']['openapi_filum2'] || '<mark lang="la">Nulla openapi filum. Adiuva me 🥺</mark>'
      @datum['jekyll-page']['openapi_filum2']
    end

    # # @deprecated use experimentum_est
    # def opus_in_progressu
    #   !!@opus_in_progressu
    # end

    # # TODO: remove obsolete parts
    # def summarius
    #   unless @datum['jekyll-page'].nil?
    #     @summarius || @datum['jekyll-page']['summarius'] || '<mark lang="la">Nulla summarius. Adiuva me 🥺</mark>'
    #   end

    #   @summarius || @datum['summarius']
    # end

    # TODO: remove obsolete parts
    # TODO: Hapi::HapiCommunePaginam.titulum?
    def titulum
      @titulum || @nomen || @title
    end

    # TODO: Hapi::HapiCommunePaginam.titulum?
    def nomen
      @titulum || @nomen || @title
    end

    # # Trivia
    # # - 'trivium'
    # #   - https://en.wiktionary.org/wiki/trivium#Latin
    # # - 'xdefallo'
    # #   - https://developers.google.com/search/blog/2013/04/x-default-hreflang-for-international-pages
    # def trivium
    #   @datum
    # end

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

    # attr_reader :xdefallo

    # # _[eng] Is this an xdefallo API? [eng]_
    # # _[por] Esta é uma API xdefallo? [por]_
    # # Trivia
    # # - 'trivium'
    # #   - https://en.wiktionary.org/wiki/trivium#Latin
    # # - 'xdefallo'
    # #   - https://developers.google.com/search/blog/2013/04/x-default-hreflang-for-international-pages
    # attr_reader :xdefallo_est
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
