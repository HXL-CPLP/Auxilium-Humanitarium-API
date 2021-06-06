# FILUM:           _lugins/hapi/utilitatem.rb
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# Trivia:
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

  # _[eng] Subclass of `Jekyll::Page` with custom method definitions. [eng]_
  # _[eng] Subclasse de `Jekyll::Page` com customizações nos métodos [eng]_
  class ApiPaginam < Jekyll::Page
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
      # data['datum'] = api_datum
      # data.merge!(api_datum['jekyll-page'])

      Jekyll::Hooks.trigger :pages, :post_init, self
    end

    # rubocop:enable Lint/MissingSuper
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
