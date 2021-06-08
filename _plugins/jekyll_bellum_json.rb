# FILUM:           _plugins/jekyll_bellum_json.rb
# LICENTIAM:       Dominium publicum
# frozen_string_literal: true

# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137

# Trivia:
# - 'bellum'
#   - https://en.wiktionary.org/wiki/bellus#Latin
# - 'json'
#   - https://www.json.org/
module Jekyll
  # {{ my_data | bellum_json }}
  module BellumJson
    def bellum_json(textum)
      require 'json'
      JSON.pretty_generate(textum)
    end
  end
end

Liquid::Template.register_filter(Jekyll::BellumJson)

# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
