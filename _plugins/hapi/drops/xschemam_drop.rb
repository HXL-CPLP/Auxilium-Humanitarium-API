# ARCHĪVUM:        _plugins/hapi/drops/xschemam_drop.rb
# DESCRIPTIONEM:
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

require_relative './commune_drop'

module Hapi
  # TODO: document...
  module Drops
    # _[por] Conteiner de coleções schemam por uma xdefallo ('x-default')
    #         Sem alguma forma
    #        de abstrair objetos que há não sejam algo como uma Jekyll:Page
    #        ou Hapi::Datum::HapiDrop o liquid e Jekyll nem mesmo irá exibir
    #        informações nas páginas HTML finais.
    # [por]_
    # @see _data/referens.yml#gid
    #
    # class HapiXschemamDrop < Liquid::Drop
    class HapiXschemamDrop < Hapi::Drops::CommuneXdefalloDrop
      attr_accessor :optionem

      # TODO: _[eng] No idea if this is necessary. Maybe remove later [eng]_
      class << self
        def global
          @global ||= HapiXschemamDrop.new
        end
      end

      def initialize(argumentum = {}) # rubocop:disable Lint/MissingSuper
        @optionem = argumentum
      end

      def schemam
        @optionem['schemam'] || []
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
