# WTF!? @see https://github.com/rubocop/ruby-style-guide/issues/301
# WTF!? @see https://github.com/rubocop/ruby-style-guide/issues/137
# rubocop:disable RubocopIsRacist/AsciiComments
# rubocop:disable Metrics/MethodLength

# frozen_string_literal: true

# Testando variaveis com caracteres alem de ASCII
@ááá = 'aa'

# Trivia:
# - 'pāginam'
#   - https://en.wiktionary.org/wiki/pagina#Latin
# - ūtilitātem
#   - https://en.wiktionary.org/wiki/utilitas#Latin

# TODO: document
# TODO: document
module HapiApi
  # HapiApiGenerator is (TODO: document)
  class HapiApiGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.categories.each do |category, posts|
        site.pages << ApiPaginam.new(site, category, posts)
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class ApiPaginam < Jekyll::Page
    def initialize(site, category, posts)
      super()
      @site = site             # the current site instance.
      @base = site.source      # path to the source directory.
      @dir  = category         # the directory the page will reside in.

      # All pages have the same filename, so define attributes straight away.
      @basename = 'index'      # filename without the extension.
      @ext      = '.html'      # the extension.
      @name     = 'index.html' # basically @basename + @ext.

      # Initialize data hash with a key pointing to all posts under current category.
      # This allows accessing the list in a template via `page.linked_docs`.
      @data = {
        'linked_docs' => posts
      }

      # Look up front matter defaults scoped to type `categories`, if given key
      # doesn't exist in the `data` hash.
      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, :categories, key)
      end
    end

    # Placeholders that are used in constructing page URL.
    def url_placeholders
      {
        category: @dir,
        basename: basename,
        output_ext: output_ext
      }
    end
  end

  # class ūtilitātem
  class Utilitatem
    def sanitize_filename_i18n(name)
      return name.to_s if name.is_a? Integer

      # TODO: investigate usage of
      #       /[[:word:]]/ - A character in one of the following Unicode
      #       general categories Letter, Mark, Number, Connector_Punctuation
      name.strip
          # Whitespace character ([:blank:], newline, carriage return, etc.)
          # replaced by -
          .gsub(/[[:space:]]/, '-')
          # /[[:cntrl:]]/ - Control character
          # remove any one present
          .gsub(/[[:cntrl:]]/, '')
    end
  end
end

# rubocop:enable Metrics/MethodLength

# WTF!? @see https://github.com/rubocop/ruby-style-guide/issues/301
# Essa porra é tão racista que obriga por rubocop:enable AsciiComments
# rubocop:enable RubocopIsRacist/AsciiComments
