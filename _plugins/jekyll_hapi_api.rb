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

    def generate(site)
      @debug_all = false

      @apis = Utilitatem.expandendum_api_datum(site.data['api'], site.data['referens'])

      # api_liquified = quod_datum_api_liquify(site, '/data/api.json')
      # referens_liquified = quod_datum_api_liquify(site, '/data/referens.json')
      # # puts site.data['referens']

      # @apis = Utilitatem.expandendum_api_datum(api_liquified, referens_liquified)

      # @apis = liquify2(site, @apis)

      # _[eng] We override site.data.api [eng]_
      # _[por] Sobrescrevemos o site.data.api [por]_
      site.data['api'] = @apis

      site.data['api'].each do |api_datum|
        @debug_est = @debug_all or api_datum['debug']
        site.pages << ApiPaginam.new(site, api_datum, @debug_est)
      end
    end

    def quod_datum_api_liquify(site, path)
      # datum_api = nil
      site.pages.each do |paginam|
        # return JSON.parse(paginam.content) if paginam.url == path
        next unless paginam.url == path

        # content = File.read(site.in_source_dir(dir, filename))
        content = paginam.content
        template = Liquid::Template.parse(content)

        context = Liquid::Context.new({}, {}, { site: site })
        rendered = template.render(context)

        puts rendered

        # return JSON.parse(paginam.content)
        return JSON.parse(rendered)
      end
      raise "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} #{path} ?"
    end

    # def liquify(site, apis)
    #   puts 'TODO liquify(site, apis)'
    #   # @see https://gist.github.com/dgopstein/7fcb514d163f7b090edd5a98b9f3f9a7
    #   context = Liquid::Context.new({}, {}, { site: site })

    #   # puts site.inspect
    #   # ruby = JSON.parse(apis)
    #   json_as_json = JSON.generate(apis)
    #   json_liquified = Liquid::Template.parse(json_as_json).render(context)

    #   JSON.parse(json_liquified)

    #   # apis
    # end

    # def liquify2(site, apis)
    #   # Debuging liquid
    #   # @see https://github.com/Shopify/liquid#error-modes
    #   Liquid::Template.error_mode = :strict # Raises a SyntaxError when invalid syntax is used

    #   # puts Jekyll.inspect
    #   # puts Jekyll.sites.inspect
    #   # puts Jekyll.sites.last.inspect
    #   # site1 Jekyll.sites.last
    #   # puts Jekyll.sites.last.data.inspect
    #   puts Jekyll.sites.last.time
    #   # puts 'TODO liquify(site, apis)'
    #   # # @see https://gist.github.com/dgopstein/7fcb514d163f7b090edd5a98b9f3f9a7
    #   context = Liquid::Context.new({}, {}, { site: site })

    #   json_as_json = JSON.generate(apis)
    #   template = Liquid::Template.parse(json_as_json)

    #   rendered = template.render(context)

    #   # puts rendered

    #   # puts Liquid::Template.parse('hello {{ x }} world!').render!(context)
    #   # puts Liquid::Template.parse('hello {{ x }} world!').render!('x' => 5)

    #   @user = 'teste'

    #   @template = Liquid::Template.parse("{{ 'style.css' | asset_url }}")
    #   # @template = Liquid::Template.parse('{% _🗣️ Hapi_api_UN_HDX_titulum 🗣️_ %}')
    #   # @template = Liquid::Template.parse('{% _ Hapi_api_UN_HDX_titulum _ %}')
    #   @template = Liquid::Template.parse('{{ site.pages }}')
    #   puts @template.render({}, registers: { user: @user })
    #   puts @template.render({}, registers: site)

    #   puts '@template.errors'
    #   puts @template.errors

    #   # puts site.inspect
    #   # ruby = JSON.parse(apis)
    #   json_liquified = Liquid::Template.parse(json_as_json).render(context)

    #   JSON.parse(json_liquified)

    #   # apis
    # end
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
    def initialize(site, api_datum, _debug)
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

    # @see https://jekyllrb.com/docs/plugins/generators/
    # Placeholders that are used in constructing page URL.
    # def url_placeholders
    #   {
    #     :category   => @dir,
    #     :basename   => basename,
    #     :output_ext => 'html'
    #     :output_ext => output_ext
    #   }
    # end
  end
end

# module Jekyll
#   # HapiApiAlternate (...)
#   class HapiApiAlternate < Liquid::Tag
#     def initialize(tag_name, text, tokens)
#       super
#       @text = text
#     end

#     def render(_context)
#       "#{@text} #{Time.now}"
#     end
#   end
# end

# # <p>{% render_time page rendered at: %}</p>
# Liquid::Template.register_tag('render_time', Jekyll::HapiApiAlternate)

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
