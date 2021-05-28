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

    # def hxlattrs_de_linguam(contextum, linguam = nil)
    def optionem_de_linguam(contextum, linguam = nil)
      linguam = linguam.nil? ? contextum['page']['linguam'] : linguam
      ref = contextum['site']['data']['referens']
      # resultatum = Struct.new(:attributum, :hashtag, :ignorandum)

      # TODO: _[por] Mover isto para alguma subrotina para o rubocop parar de reclamar [por]_
      raise "_data/referens.yml: Non linguam [#{linguam}]!" if ref['linguam'][linguam].nil?
      raise '_data/referens.yml: Non hxl.linguam!' if ref['hxl']['linguam'].nil?

      Struct.new(:attributum, :hashtag, :ignorandum).new(
        ref['linguam'][linguam]['hxlattrs'],
        ref['hxl']['linguam']['hashtag'],
        ref['hxl']['linguam']['ignorandum']
      )
    end

    # TODO: 'quod obiectum attribūtum existendum?' tá mal traduzido
    def quod_obiectum_optionem_existendum(obiectum, hxloptionem)
      puts 'hxloptionem obiectum'

      puts hxloptionem
      puts obiectum
      puts ''
      puts 'oiiiiii'
      # puts hxloptionem.dig(':attributum')
      puts hxloptionem['attributum']
      # puts obiectum
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
