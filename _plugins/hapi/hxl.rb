# FILUM:           _plugins/hapi/hxl.rb
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

module Hapi
  # _[eng] Rudimentar HXL utils for Hapi. [eng]_
  # _[por] Utilitários HXL para Hapi. [por]_
  module HXL
    module_function

    def hxlattrs_de_linguam(contextum, linguam = nil)
      linguam = linguam.nil? ? contextum['page']['linguam'] : linguam
      # TODO: _[por] Implementar mensagem de erro se usuário errar linguam
      #              como usar 'linguam: por' em vez de 'linguam: por-Latn'
      #       [por]_
      # hxlattrs = contextum['site']['data']['referens']['linguam'][linguam]['hxlattrs']
      #
      # hxlattrs

      contextum['site']['data']['referens']['linguam'][linguam]['hxlattrs']
    end

    # TODO: 'quod obiectum attribūtum existendum?' tá mal traduzido
    def quod_obiectum_attributum_existendum(obiectum, hxlattrs)
      puts hxlattrs
      puts obiectum
      true
    end

    def testum(obiectum, hxlattrs)

      puts 'testum'
      puts obiectum
      puts hxlattrs

      "TODO #{hxlattrs}"
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
