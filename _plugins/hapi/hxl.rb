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

      HXLOptionem.new(
        ref['linguam'][linguam]['hxlattrs'],
        ref['hxl']['linguam']['hashtag'],
        ref['hxl']['linguam']['ignorandum']
      )
    end

    # TODO: 'quod obiectum attribūtum existendum?' tá mal traduzido
    def quod_obiectum_optionem_existendum(obiectum, hxloptionem)
      # puts 'hxloptionem obiectum'

      # puts hxloptionem
      # puts obiectum
      # puts ''
      # puts 'oiiiiii'
      # puts ''
      # # puts hxloptionem.dig(':attributum')
      # puts hxloptionem.attributum
      # puts '     quod_columnam'
      # puts hxloptionem.quod_columnam(obiectum)
      # puts obiectum
      true
    end

    def testum(obiectum, hxlattrs)
      # puts 'testum'
      # puts obiectum
      # puts hxlattrs

      "TODO #{hxlattrs}"
    end

    # _[eng] A quick helper to , for a guiven linguam, make inferences from
    #        _data/referens.yml to what is likely to be desired column
    # [eng]_
    class HXLOptionem
      attr_accessor :attributum, :hashtag, :ignorandum, :referens

      def initialize(attributum = nil, hashtag = nil, ignorandum = nil, referens = ['#item+id'] )
        @attributum = attributum
        @hashtag = hashtag
        @ignorandum = ignorandum
        @referens = referens
      end

      def hashtag_exemplum
        prefix = @hashtag.nil? ? [''] : @hashtag
        suffix = @attributum.nil? ? [''] : @attributum
        resultatum = []
        prefix.each do |pre|
          suffix.each do |suf|
            resultatum.append("#{pre}#{suf}")
          end
        end
        resultatum
      end

      # Trivia:
      # - 'columnam'
      #   - https://en.wiktionary.org/wiki/columna#Latin
      # def quod_columnam(obiectum)
      def quod_obiectum_optionem_existendum(obiectum)
        puts 'quod_columnam'
        puts obiectum.keys
        # puts obiectum
        false
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
