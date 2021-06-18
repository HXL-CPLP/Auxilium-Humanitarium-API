# @ARCHĪVUM         _plugins/hapi/paginam/commune.rb
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

require 'json'

# Trivia:
# - 'Hapi'
#   - https://hapi.etica.ai/
# - 'commūne'
#   - https://en.wiktionary.org/wiki/communis#Latin
module Hapi
  # _[eng] Subclass of `Jekyll::Page` with custom method definitions. [eng]_
  # _[eng] Subclasse de `Jekyll::Page` com customizações nos métodos [eng]_
  class HapiPaginamCommune < Jekyll::Page # rubocop:disable Metrics/ClassLength
    # attr_accessor :datum, :gid, :uid, :xdefallo, :xdefallo_est, :experimentum_est
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
    # - 'dēscrīptiōnem'
    #   - https://en.wiktionary.org/wiki/descriptio#Latin
    def descriptionem
      @datum['summarius']
    end

    # Trivia
    # - 'gid'
    #   - https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
    def gid_est?(gid)
      # puts "gid_est?(gid) #{@gid} #{gid}"
      @gid == gid
    end

    def html_body_class
      [
        'paginam-typum-schemam',
        "paginam-linguam-#{@datum['linguam']}"
      ]
    end

    def hreflang
      return 'x-default' if @xdefallo_est

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

    def nomen
      @datum['nomen'] || @datum['titulum']
    end

    # def openapi_filum
    #   # @datum['jekyll-page']['openapi_filum2'] || '<mark lang="la">Nulla openapi filum. Adiuva me 🥺</mark>'
    #   @datum['jekyll-page']['openapi_filum2']
    # end

    # @deprecated use experimentum_est
    def opus_in_progressu
      !!@opus_in_progressu
    end

    # TODO: remove obsolete parts
    def summarius
      unless @datum['jekyll-page'].nil?
        @summarius || @datum['jekyll-page']['summarius'] || '<mark lang="la">Nulla summarius. Adiuva me 🥺</mark>'
      end

      @summarius || @datum['summarius']
    end

    def tags
      # @see Utilitatem.tags_de_api
      [
        'schemam',
        "schemam-linguam-#{linguam}",
        "schemam-trivium-#{trivium}"
      ]
    end

    # # TODO: remove obsolete parts
    # def titulum
    #   # {% _🗣️ schemam_datum_nomen 🗣️_ %}: {{ schemam.nomen }}
    #   prefix = Hapi::HSD.l10n_simplex('schemam_datum_nomen', linguam)
    #   # @titulum || @nomen || @title || @datum['summarius']

    #   "#{prefix} : #{nomen}"
    # end

    def titulum
      @datum['titulum'] || @datum['nomen']
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

    def slug
      @datum['lid']
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
