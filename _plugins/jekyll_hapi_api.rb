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
      puts site.data['api'][0]

      # site.data['api'].map do |api|
      #   # api["testes123"] = api["linguam"] + '/'
      #   api['uid2'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/#{api['lid']}/"
      #   # api['locale'] = HapiApi::Utilitatem.linguam_to_html_lang(api['linguam'])
      #   api['locale'] = Utilitatem.linguam_to_html_lang(api['linguam'])
      #   # api['locale'] = linguam_to_html_lang(api['linguam'])
      # end

      @apis = Utilitatem.expandendum_api_datum(site.data['api'])

      site.data['api'] = @apis

      puts @apis[0]

      # site.pages << ApiPaginam.new(site)

      # site.pages << ApiPaginam.new(site, @apis)
      # site.pages << ApiPaginam.new(site, nil, nil, nil)
      # site.pages << ApiPaginam.new(site)

      # site.data['api'].each do |api|
      #   puts api
      #   site.pages << ApiPaginam.new(site, api)
      # end
      # site.categories.each do |category, posts|
      #   site.pages << ApiPaginam.new(site, category, posts)
      # end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class ApiPaginam < Jekyll::Page
    # def initialize(site, category, posts)
    # def initialize(site, _api)

    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Lint/MissingSuper

    # Initialize a new Page.
    #
    # site - The Site object.
    # base - The String path to the source.
    # dir  - The String path between the source and the file.
    # name - The String filename of the file.
    # def initialize(site, _base, _dir, _name)
    def initialize(site)
      # def initialize(site)
      # warning:Lint/MissingSuper
      # super()
      @site = site             # the current site instance.
      @base = site.source      # path to the source directory.
      # @dir  = category         # the directory the page will reside in.

      # # All pages have the same filename, so define attributes straight away.
      # @basename = 'index'      # filename without the extension.
      # @ext      = '.html'      # the extension.
      # @name     = 'index.html' # basically @basename + @ext.

      # # Initialize data hash with a key pointing to all posts under current category.
      # # This allows accessing the list in a template via `page.linked_docs`.
      # @data = {
      #   'linked_docs' => posts
      # }

      # # Look up front matter defaults scoped to type `categories`, if given key
      # # doesn't exist in the `data` hash.
      # data.default_proc = proc do |_, key|
      #   site.frontmatter_defaults.find(relative_path, :categories, key)
      # end
    end

    # # Placeholders that are used in constructing page URL.
    # def url_placeholders
    #   {
    #     category: @dir,
    #     basename: basename,
    #     output_ext: output_ext
    #   }
    # end

    # rubocop:enable Metrics/MethodLength
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
        api['uid2'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/#{api['lid']}/"
        api['locale'] = Utilitatem.linguam_to_html_lang(api['linguam'])
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
