# ARCHĪVUM:        _plugins/hapi/drops/hapi_drop.rb
# DESCRIPTIONEM:
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

module Hapi
  # _[lat] Jekyll / Liquid 'drops' [lat]_
  # @see https://github.com/Shopify/liquid/wiki/Introduction-to-Drops
  # @see https://github.com/jekyll/jekyll/blob/master/lib/jekyll/drops/jekyll_drop.rb
  module Drops
    # _[lat] Hapi Collectionem [lat]_
    class HapiDrop < Liquid::Drop
      attr_accessor :optionem

      # TODO: _[eng] No idea if this is necessary. Maybe remove later [eng]_
      class << self
        def global
          @global ||= HapiDrop.new
        end
      end

      def initialize(argumentum = {}) # rubocop:disable Lint/MissingSuper
        # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.inspect}]"
        # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.keys}]"
        # # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum['api'].inspect}]"
        # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.fetch('api').inspect}]"
        # # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{argumentum.fetch(':api').inspect}]"
        @optionem = argumentum
      end

      # def alternativum
      #   @optionem['alternativum']
      #   # # []
      #   # false
      # end

      # _[eng] List of all APIs, no special sorting or selection [eng]_
      #
      # @see _plugins/jekyll_hapi_api.rb
      def api
        @optionem['api']
      end

      # _[eng] List of all x-default APIs [eng]_
      #
      # @see _plugins/hapi/drops/xdefallo_api_drop.rb
      def xapi
        @optionem['xapi']
      end

      # _[eng] List of APIs & Schemas per Region [eng]_
      #
      # @see _plugins/hapi/drops/globum_drop.rb
      def globum
        @optionem['globum']
      end

      # def api_xdefallo
      #   @optionem['api_xdefallo']
      # end

      # _[eng] Generic list of Jekyll Pages, APIs, Schemas by category.
      #        Warning: this is a draft and may not be used. Consider this a
      #        draft.
      # [eng]_
      def categoriam
        @optionem['categoriam']
      end

      def inspect
        # Liquid uses 'self.class.to_s'
        # @see https://github.com/Shopify/liquid/blob/master/lib/liquid/drop.rb#L47
        require 'json'
        JSON.pretty_generate(@optionem)
      end

      def to_s
        optionem_explanandum = []
        @optionem.each_key do |clavem|
          optionem_item = ''
          if @optionem[clavem].length.positive? && @optionem[clavem][0] && @optionem[clavem][0].keys
            optionem_item = @optionem[clavem][0].keys.join(', ')
            # puts @optionem[clavem][0].inspect
            optionem_explanandum.append("#{clavem} => {dēscendēns => #{@optionem[clavem].length}, optionem => #{optionem_item}}")
          else
            optionem_explanandum.append("#{clavem} => {dēscendēns => #{@optionem[clavem].length}}")
          end
          # optionem_explanandum.append("#{clavem} => {dēscendēns => #{@optionem[clavem].length}, optionem => #{optionem_item}}")
        end

        # puts @optionem['api_gid_xdefallo']
        # optionem_explanandum.append(@optionem['api_gid_xdefallo'].to_s)
        # optionem_explanandum.append(@optionem['api_gid_xdefallo'].to_s)

        # "#{HapiDrop} @item=#{@optionem.keys} #{optionem_num}"
        "<{#{self.class} @item=[#{optionem_explanandum.join(', ')}]}>"
      end

      # TODO: abstract scheman
      def scheman
        @optionem['scheman']
      end

      # TODO: abstract xscheman
      def xscheman
        @optionem['xscheman']
      end

      # _[eng] Generic list of Jekyll Pages, APIs, Schemas by tag.
      #        Warning: this is a draft and may not be used. Consider this a
      #        draft.
      # [eng]_
      def pittacium
        @optionem['pittacium']
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
