# ARCHĪVUM:        _plugins/hapi/drops/hapi_drop.rb
# DESCRIPTIONEM:
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

module Hapi
  # TODO: document...
  module Drops
    # _[por] Conteiner de coleções apis por uma xdefallo ('x-default')
    #         Sem alguma forma
    #        de abstrair objetos que há não sejam algo como uma Jekyll:Page
    #        ou Hapi::Datum::HapiDrop o liquid e Jekyll nem mesmo irá exibir
    #        informações nas páginas HTML finais.
    # [por]_
    # @see _data/referens.yml#gid
    #
    # Trivia
    # - 'api':
    #   - https://www.wikidata.org/wiki/Q165194
    # - 'xdefallo':
    #   - https://en.wikipedia.org/wiki/Hreflang
    class HapiXdefalloApiDrop < Liquid::Drop
      attr_accessor :optionem

      # TODO: _[eng] No idea if this is necessary. Maybe remove later [eng]_
      class << self
        def global
          @global ||= HapiXdefalloApiDrop.new
        end
      end

      def initialize(argumentum = {}) # rubocop:disable Lint/MissingSuper
        @optionem = argumentum
      end

      def inspect
        require 'json'
        JSON.pretty_generate(@optionem)
      end

      def to_s
        "<#{self.class} @item=#{@optionem.keys}>"
      end

      def lid
        puts 'lid'
        @optionem['lid'] || @optionem['datum']['lid']
      end

      def gid
        @optionem['gid']
      end

      def linguam
        @optionem['linguam']
      end

      def api
        @optionem['api'] || []
      end

      def xdefallo
        @optionem['xdefallo'] || []
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
