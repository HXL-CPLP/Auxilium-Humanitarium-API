# FILUM:           _plugins/jekyll_liquify.rb
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# Trivia:
# - 'liquify'
#   - https://fettblog.eu/snippets/jekyll/liquid-in-frontmatter/
# frozen_string_literal: true

# _[eng] Allow use Liquid markup on Jekyll front matter [eng]_
module LiquidFilter
  def liquify(input)
    Liquid::Template.parse(input).render(@context)
  end
end
Liquid::Template.register_filter(LiquidFilter)

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments

# see also
# - https://humanwhocodes.com/blog/2019/04/jekyll-hooks-output-markdown/
# - https://gist.github.com/dgopstein/7fcb514d163f7b090edd5a98b9f3f9a7
# - https://github.com/jekyll/jekyll/blob/be78b4246c4513738eb4c18b76569182dd4f8578/lib/jekyll/renderer.rb#L70-L93
