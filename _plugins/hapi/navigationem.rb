# FILUM:           _plugins/hapi/navigationem.rb
# DESCRIPTIONEM:   _[eng] Rudimentar HXL utils for Hapi. [eng]_
#                  _[por] Utilitários HXL para Hapi. [por]_
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

# Trivia:
# - 'HXL'
#   - https://hxlstandard.org/
# - 'obiectum'
#   - https://en.wiktionary.org/wiki/obiectum#Latin
# - 'attribūtum'
#   - https://en.wiktionary.org/wiki/attributus#Latin
# - contextum
#   - https://en.wiktionary.org/wiki/contextus#Latin
# - "referēns"
#   - https://en.wiktionary.org/wiki/referens#Latin
#   - https://en.wiktionary.org/wiki/reference#English
# - 'capiendum'
#   - https://en.wiktionary.org/wiki/capio#Latin
# - 'existendum'
#   - https://en.wiktionary.org/wiki/existo#Latin

# require 'logger'

module Hapi
  # _[eng] Module related to site navitation [eng]_
  # _[por] Modulo relacionado a navegação do site [por]_
  module Navigationem
    # module_function

    # _[eng] TODO: document
    # [eng]_
    class Api
      attr_accessor :contextum

      def initialize(contextum)
        puts 'todo'
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar AsciiComments
# [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
