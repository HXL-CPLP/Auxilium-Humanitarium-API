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
    # _[por] Conteiner de coleções de dados por região global. Sem alguma forma
    #        de abstrair objetos que há não sejam algo como uma Jekyll:Page
    #        ou Hapi::Datum::HapiDrop o liquid e Jekyll nem mesmo irá exibir
    #        informações nas páginas HTML finais.
    # [por]_
    # @see # _data/referens.yml#gid
    class HapiGlobumDrop < Liquid::Drop
      attr_accessor :optionem

      # TODO: _[eng] No idea if this is necessary. Maybe remove later [eng]_
      class << self
        def global
          @global ||= HapiGlobumDrop.new
        end
      end

      def initialize(argumentum = {}) # rubocop:disable Lint/MissingSuper
        # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.inspect}]"
        # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.keys}]"
        # # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum['api'].inspect}]"
        # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.fetch('api').inspect}]"
        # # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.fetch(':api').inspect}]"
        # puts argumentum
        @optionem = argumentum
      end

      def collectionem_api
        @optionem['collectionem_api'] || []
      end

      def collectionem_schemam
        @optionem['collectionem_schemam'] || []
      end

      def collectionem_tm
        @optionem['collectionem_tm'] || []
      end

      # @see _plugins/hapi/drops/xdefallo_api_drop.rb
      # @see https://developers.google.com/search/blog/2013/04/x-default-hreflang-for-international-pages
      def collectionem_xapi
        @optionem['collectionem_xapi'] || []
      end

      # NOTE: _[eng] collectionem_xtm is a draft [eng]_
      def collectionem_xtm
        @optionem['collectionem_xtm'] || []
      end

      # NOTE: _[eng] collectionem_xschemam is a draft [eng]_
      def collectionem_xschemam
        @optionem['collectionem_xschemam'] || []
      end

      def descriptionem
        @optionem['descriptionem']
      end

      def gid
        @optionem['gid']
      end

      def inspect
        # Liquid uses 'self.class.to_s'
        # @see https://github.com/Shopify/liquid/blob/master/lib/liquid/drop.rb#L47
        require 'json'
        JSON.pretty_generate(@optionem)
      end

      def nomen
        @optionem['nomen']
      end

      # _[eng] Returns the object as a debug String [eng]_
      def to_s
        # "#<#{self.class} @gid=#{gid} @item=#{@optionem.keys}>"
        "#<#{self.class} @gid=#{gid} @optionem=[#{@optionem.keys.join(', ')}]>"
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
