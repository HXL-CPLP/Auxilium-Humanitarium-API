# WTF!? @see https://github.com/rubocop/ruby-style-guide/issues/301
# WTF!? @see https://github.com/rubocop/ruby-style-guide/issues/137
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments

# frozen_string_literal: true

# Testando variaveis com caracteres alem de ASCII
@ááá = 'aa'

# Trivia:
# - 'datum'
#   - https://en.wiktionary.org/wiki/datum#Latin
# - 'pāginam'
#   - https://en.wiktionary.org/wiki/pagina#Latin
# - ūtilitātem
#   - https://en.wiktionary.org/wiki/utilitas#Latin
# - 'expandendum'
#   - https://en.wiktionary.org/wiki/expando#Latin

# TODO: document
# TODO: document
module HapiApi
  # HapiApiGenerator is (TODO: document)
  class HapiApiGenerator < Jekyll::Generator
    safe true

    def generate(site)
      @debug_all = false

      @apis = Utilitatem.expandendum_api_datum(site.data['api'])

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
    def initialize(site, api_datum, debug)
      # super()
      @site = site              # the current site instance.
      @base = site.source       # path to the source directory.
      # @dir  = api_datum['dir']  # the directory the page will reside in.
      # @name = api_datum['lid']
      @dir  = api_datum['dir'] + '/' + api_datum['lid'] + '/'
      @name = 'index.html'
      template = api_datum['jekyll-page']['template']

      @path = if @site.layouts[template].path.end_with? 'html'
                @site.layouts[template].path.dup
              else
                File.join(@site.layouts[template].path, @site.layouts[template].name)
              end

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

      # puts 'oi_2'
      # puts data
      Jekyll::Hooks.trigger :pages, :post_init, self
    end

    # rubocop:enable Lint/MissingSuper
  end

  # _[eng] Generic utils [eng]_
  # _[por] Utilitários diversos [por]_
  module Utilitatem
    module_function

    # _[eng] TODO: document [eng]_
    # _[por] TODO: por ser documentado [por]_
    def sanitize_filename_i18n(name)
      return name.to_s if name.is_a? Integer

      # TODO: _[eng] investigate usage of  /[[:word:]]/ [eng]_
      name.strip
          # Whitespace character ([:blank:], newline, carriage return, etc.)
          # replaced by -
          .gsub(/[[:space:]]/, '-')
          # /[[:cntrl:]]/ - Control character
          # remove any one present
          .gsub(/[[:cntrl:]]/, '')
    end

    # _[eng] Macro to 'expand' user written api data to new variables  [eng]_
    # _[por] Macro para 'expandir' o que usuário escreveu [por]_
    def expandendum_api_datum(apis)
      apis.map do |api|
        api['uid'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/#{api['lid']}/"
        api['dir'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/"
        # api['locale'] = Utilitatem.linguam_to_html_lang(api['linguam'])

        api['jekyll-page'] = {
          # 'locale' => Utilitatem.linguam_to_html_lang(api['linguam']),
          'linguam' => api['linguam'],
          'lang' => Utilitatem.linguam_to_html_lang(api['linguam']),
          'title' => api['title'],
          'description' => api['description'] || api['descriptionem'],
          'template' => 'api',
          'layout' => 'api'
        }

        api['debug'] = true
      end

      apis
    end

    # _[eng] We use ISO 639-3, but HTML lang wants BCP-47 [eng]_
    # _[por] Usamos ISO 639-3, porém HTML lang deseja BCP-47 [por]_
    def linguam_to_html_lang(linguam)
      @referens = {
        'eng' => 'en',
        'por' => 'pt',
        'lat' => 'la',
        'mul' => 'pt'
      }
      @referens[linguam]
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
