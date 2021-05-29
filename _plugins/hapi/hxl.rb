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

# require 'logger'

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
    def quod_obiectum_optionem_existendum(_obiectum, _hxloptionem)
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

    def testum(_obiectum, hxlattrs)
      # puts 'testum'
      # puts obiectum
      # puts hxlattrs

      "TODO #{hxlattrs}"
    end

    # _[eng] A quick helper to , for a guiven linguam, make inferences from
    #        _data/referens.yml to what is likely to be desired column
    # [eng]_
    class HXLOptionem
      attr_accessor :attributum, :hashtag, :ignorandum_hashtag, :ignorandum_attributum, :referens

      def initialize(attributum = nil, hashtag = nil, ignorandum = nil, referens = ['#item+id'])
        @attributum = attributum
        @hashtag = hashtag
        @ignorandum_hashtag = ignorandum.nil? || ignorandum['hashtag'].nil? ? nil : ignorandum['hashtag']
        @ignorandum_attributum = ignorandum.nil? || ignorandum['attributum'].nil? ? nil : ignorandum['attributum']
        # @ignorandum_attributum = ignorandum&.attributum
        # @ignorandum = ignorandum
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
        opts = _chaves_relevantes(obiectum)
        uglyhack = hashtag_exemplum

        unless @referens.any? { |ref| opts.include?(ref) }
          # log.debug("Created Logger")
          puts " > Hapi.HXL.HXLOptionem: non referens [#{referens}]"
          return false
        end
        unless uglyhack.any? { |ref| opts.include?(ref) }
          # puts "Hapi.HXL.HXLOptionem: non obiectum_optionem [#{uglyhack}]"
          puts " > Hapi.HXL.HXLOptionem: non obiectum_optionem [#{uglyhack}][#{opts}]"
          # log.debug("Created Logger")
          return false
        end

        puts 'encontrou'
        true
      end

      # Trivia:
      # - 'valendum'
      #   - https://en.wiktionary.org/wiki/valeo#Latin
      def quod_obiectum_valendum(obiectum, referens_valendum)
        # opts = _chaves_relevantes(obiectum)

        # puts 'referens'
        # puts @referens
        @referens.each do |hxlkey|
          # unless obiectum[key].nil? || obiectum[key] != referens
          #   return true
          # end
          # puts "referens_valendum [#{referens_valendum}]"
          # puts "hxlkey [#{hxlkey}]"
          # puts "obiectum[hxlkey] [#{obiectum[hxlkey]}]"
          # puts obiectum[key]
          next if obiectum[hxlkey].nil? || obiectum[hxlkey] != referens_valendum

          # return obiectum[key] unless obiectum[key].nil? || obiectum[key] != referens

          puts "quod_obiectum_valendum #{referens_valendum} #{referens}: #{obiectum}"

          # TODO: agora procure a chave certa, nao retorne a mesma key :)
          return _chave_com_resultado_de_objeto_certo(obiectum)
        end

        return false
      end

      private

      def _chave_com_resultado_de_objeto_certo(obiectum)
        uglyhack = hashtag_exemplum
        uglyhack.each do |hxlkey|
          puts 'ENCONTRADO!' if obiectum.key?(hxlkey)
          return obiectum[hxlkey] if obiectum.key?(hxlkey)
        end
        raise "_chave_com_resultado_de_objeto_certo: non resultatum [#{uglyhack}] [#{obiectum}]"
      end

      def _chaves_relevantes(obiectum)
        obiectum.keys

        # obiectum.keys.select do |item|
        #   unless @ignorandum_hashtag.nil?
        #     @ignorandum_hashtag.each do |ig_hash|
        #       # puts "   #{item}"
        #       return false if item.start_with?(ig_hash)
        #     end
        #   end
        #   unless @ignorandum_attributum.nil?
        #     @ignorandum_attributum.each do |ig_attr|
        #       return false if item.include?(ig_attr)
        #     end
        #   end

        #   true
        # end
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
