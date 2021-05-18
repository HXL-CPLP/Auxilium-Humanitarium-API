# WTF!? @see https://github.com/rubocop/ruby-style-guide/issues/301
# rubocop:disable AsciiComments

# frozen_string_literal: true

# Trivia:
# - 'pāginam'
#   - https://en.wiktionary.org/wiki/pagina#Latin
# - ūtilitātem
#   - https://en.wiktionary.org/wiki/utilitas#Latin

# TODO: document
# lorem ipsum..
module HapiApi
  # TODO: document
  # lorem ipsum..
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
end

#   Liquid::Template.register_filter(Jekyll::DataPageLinkGenerator)
# WTF!? @see https://github.com/rubocop/ruby-style-guide/issues/301
# Essa porra é tão racista que obriga por rubocop:enable AsciiComments
# rubocop:enable AsciiComments
