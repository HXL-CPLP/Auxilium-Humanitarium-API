# ARCHĪVUM:        _plugins/hapi/drops/commune.rb
# DESCRIPTIONEM:
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

module Hapi
  # Hapi modulum est

  module Drops
    # _[por] Conteiner de coleções schemam por uma xdefallo ('x-default')
    #         Sem alguma forma
    #        de abstrair objetos que há não sejam algo como uma Jekyll:Page
    #        ou Hapi::Datum::HapiDrop o liquid e Jekyll nem mesmo irá exibir
    #        informações nas páginas HTML finais.
    # [por]_
    # @see _data/referens.yml#gid
    class CommuneXdefalloDrop < Liquid::Drop
      attr_accessor :optionem

      # TODO: _[eng] No idea if this is necessary. Maybe remove later [eng]_
      class << self
        def global
          @global ||= CommuneXdefalloDrop.new
        end
      end

      def initialize(argumentum = {}) # rubocop:disable Lint/MissingSuper
        @optionem = argumentum
      end

      def alternativum
        # puts ''
        # puts  @optionem['alternativum'][1]['linguam']
        @optionem['alternativum']
        # []
        # false
      end

      def alternativum_linguam
        resultatum = []
        @optionem['alternativum'].each do |apt_alt|
          # puts 'achou!'
          resultatum.append(apt_alt['linguam'])
        end

        resultatum
      end

      def gid
        @optionem['gid']
      end

      def inspect
        require 'json'
        JSON.pretty_generate(@optionem)
      end

      # def keys
      #   keys = []
      #   # @optionem.each do |clavem, _valendum|
      #   #   keys.append(clavem)
      #   # end

      #   keys
      # end

      def lid
        # puts 'lid'
        @optionem['lid'] || @optionem['datum']['lid']
      end

      def linguam
        @optionem['linguam']
      end

      # _[eng] Returns the object as a debug String [eng]_
      def to_s
        opts = @optionem.keys + ['alternativum_linguam']
        # opts = self.keys
        "#<#{self.class} @gid=#{gid} @lid=#{lid} @optionem=[#{opts.join(', ')}]>"
      end

      # def linguam_est
      #   @optionem['linguam']
      # end

      def xdefallo
        @optionem['xdefallo'] || []
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
