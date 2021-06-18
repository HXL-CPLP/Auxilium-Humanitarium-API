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

      def inspect
        # Liquid uses 'self.class.to_s'
        # @see https://github.com/Shopify/liquid/blob/master/lib/liquid/drop.rb#L47
        require 'json'
        JSON.pretty_generate(@optionem)
      end

      # def to_s
      #   optionem_explanandum = []
      #   @optionem.each_key do |clavem|
      #     optionem_explanandum.append(clavem) if !clavem.nil? && !clavem.empty?
      #     #   optionem_item = ''
      #     #   if @optionem[clavem].length.positive? && @optionem[clavem][0] && @optionem[clavem][0]&.keys
      #     #     optionem_item = @optionem[clavem][0].keys.join(', ')
      #     #     # puts @optionem[clavem][0].inspect
      #     #     optionem_explanandum.append("#{clavem} => {dēscendēns => #{@optionem[clavem].length}, optionem => #{optionem_item}}")
      #     #   else
      #     #     optionem_explanandum.append("#{clavem} => {dēscendēns => #{@optionem[clavem].length}}")
      #     #   end
      #     #   # optionem_explanandum.append("#{clavem} => {dēscendēns => #{@optionem[clavem].length}, optionem => #{optionem_item}}")
      #   end

      #   # puts @optionem['api_gid_xdefallo']
      #   # optionem_explanandum.append(@optionem['api_gid_xdefallo'].to_s)
      #   # optionem_explanandum.append(@optionem['api_gid_xdefallo'].to_s)

      #   # "#{HapiDrop} @item=#{@optionem.keys} #{optionem_num}"
      #   "{#{self.class} @gid=#{gid} @item=[#{optionem_explanandum.join(', ')}]}"
      #   # "{#{self.class} @gid=#{gid}}"
      # end

      def to_s
        # "#<#{self.class} @gid=#{gid} @item=#{@optionem.keys}>"
        "#<#{self.class} @gid=#{gid} @optionem=[#{@optionem.keys.join(', ')}]>"
      end

      def gid
        @optionem['gid']
      end

      def nomen
        @optionem['nomen']
      end

      def descriptionem
        @optionem['descriptionem']
      end

      def collectionem_api
        @optionem['collectionem_api'] || []
      end

      # @see _plugins/hapi/drops/xdefallo_api_drop.rb
      # @see https://developers.google.com/search/blog/2013/04/x-default-hreflang-for-international-pages
      def collectionem_xapi
        @optionem['collectionem_xapi'] || []
      end

      def collectionem_schemam
        @optionem['collectionem_schemam'] || []
      end

      # NOTE: _[eng] collectionem_xschemam is a draft [eng]_
      def collectionem_xschemam
        @optionem['collectionem_xschemam'] || []
      end

      def collectionem_tm
        @optionem['collectionem_tm'] || []
      end

      # NOTE: _[eng] collectionem_xtm is a draft [eng]_
      def collectionem_xtm
        @optionem['collectionem_xtm'] || []
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
