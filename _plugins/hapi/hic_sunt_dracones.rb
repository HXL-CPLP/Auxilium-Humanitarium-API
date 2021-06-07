# FILUM:           _plugins/hapi/hic_sunt_dracones.rb
# DESCRIPTIONEM:   _[lat] hic sunt dracones [lat]_
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# Trivia:
# - 'hic sunt dracones'
#   - https://en.wikipedia.org/wiki/Here_be_dragons
# frozen_string_literal: true

module Hapi
  # @see https://en.wikipedia.org/wiki/Here_be_dragons
  module HicSuntDracones
    module_function

    def testum
      puts 'okay'
      puts 'Jekyll.sites.last.inspect'
      puts Jekyll.sites.last.inspect
      puts 'Jekyll.sites.last.data.inspect'
      puts Jekyll.sites.last.data.inspect
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
