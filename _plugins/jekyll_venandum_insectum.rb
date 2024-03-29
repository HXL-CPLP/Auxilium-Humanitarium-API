# ARCHĪVUM:        _plugins/jekyll_venandum_insectum.rb
# LICENTIAM:       Dominium publicum
# frozen_string_literal: true

# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137

# Trivia:
# - 'summārius'
#   - https://en.wiktionary.org/wiki/summary#English
# - 'rem'
#   - https://en.wiktionary.org/wiki/res#Latin
module Jekyll
  # {{ my_complex_object | summarius }}
  module Summarius
    # See also
    # - keys
    #   - https://stackoverflow.com/questions/38912891/with-jekyll-liquid-how-to-get-all-keys-of-a-yml-hash
    #     - https://github.com/dalenys/jekyll-keys-filter
    #       - https://github.com/MichaelCurrin/jekyll-keys-filter
    def summarius(rem)
      # TODO: implement a summary for deep objects
      rem.keys
    rescue StandardError
      require 'json'
      JSON.pretty_generate(rem)
    end
  end
end

Liquid::Template.register_filter(Jekyll::Summarius)


# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
