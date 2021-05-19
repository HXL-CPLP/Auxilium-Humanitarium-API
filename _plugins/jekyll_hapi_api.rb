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

      @debug_all = true

      @apis = Utilitatem.expandendum_api_datum(site.data['api'])

      site.data['api'] = @apis

      # puts @apis[0]

      site.data['api'].each do |api|
        @debug_est = @debug_all or api['debug']
        # @template_est = 'api'
        @jekyll_datum = {
          'template' => 'api'
        }
        # puts api
        # puts 'oi'
        # @teste = ApiPaginam.new(site, site.source, api['dir'], api['lid'], @template_est, @debug_est)
        # debug @teste
        # puts 'oi2'
        # puts @teste.inspect
        site.pages << ApiPaginam.new(site, api, @jekyll_datum, @debug_est)
        # break
      end

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

    # rubocop:disable Lint/MissingSuper

    # Initialize a new Page.
    #
    # site          - The Site object.
    # api_datum     - API Datum
    # jekyll_datum  - Jekyll Datum
    # debug         - Debug est?
    def initialize(site, api_datum, jekyll_datum, debug)
      # def initialize(site)
      # warning:Lint/MissingSuper
      # super()
      @site = site              # the current site instance.
      @base = site.source       # path to the source directory.
      @dir  = api_datum['dir']  # the directory the page will reside in.
      @name = api_datum['lid']
      template = jekyll_datum['template']

      puts 'oi_1'
      puts data

      # @path = site.in_source_dir(base, dir, name)
      # @path = File.join(@site.layouts[template].path, @site.layouts[template].name)

      # puts @site.layouts
      # puts 'oi3'
      # puts @site.layouts['api']

      if @site.layouts[template].path.end_with? 'html'
        @path = @site.layouts[template].path.dup
      else
        @path = File.join(@site.layouts[template].path, @site.layouts[template].name)
      end

      # puts debug

      # if debug
      #     [:base, :dir, :name].each do |variable|
      #       puts ">> #{variable}: #{eval(variable.to_s)}"

      # if debug
      #   puts ">> base [#{base}] dir [#{dir}]"
      #   # puts ">> site.posts [#{site.posts}]"
      #   # require 'json'
      #   # puts ">> site.posts.docs.last [#{site.posts.docs.to_json}]"
      #   # puts ">> site.posts.docs.last [#{site.posts.docs[0]}]"
      #   puts ">> site.posts [#{site.posts.inspect}]"
      #   # puts ">> base [#{base}] dir [#{dir}]"
      #   # puts ">> base #{base}"
      # end

      process(name)
      # read_yaml(PathManager.join(base, dir), name)

      base_path = @site.layouts[template].path
      base_path.slice! @site.layouts[template].name
      self.read_yaml(base_path, @site.layouts[template].name)

      generate_excerpt if site.config['page_excerpts']

      # _[por] Não estamos usando Jekyll defaults [por]_
      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, type, key)
      end


      # self.data, rubocop complaints about self.
      data['datum'] = api_datum
      # data.merge!(api_datum)

      puts 'oi_2'
      puts data
      Jekyll::Hooks.trigger :pages, :post_init, self

      puts 'oi_3'
      puts data

      # return nil

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
        api['dir'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/"
        api['locale'] = Utilitatem.linguam_to_html_lang(api['linguam'])

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
