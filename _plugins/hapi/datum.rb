# FILUM:           _plugins/hapi/datum.rb
# DESCRIPTIONEM:   _[eng] Hapi ruby Data classes [eng]_
#                  _[por] Hapi ruby, classes de dados [por]_
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
# frozen_string_literal: true

# Trivia:
# - 'datum'
#   - https://en.wiktionary.org/wiki/datum#Latin

# require 'logger'
# temp https://stackoverflow.com/questions/4554325/what-is-the-most-efficient-way-to-initialize-a-class-in-ruby-with-different-para
module Hapi
  # _[eng] Hapi ruby Data classes [eng]_
  # _[por] Hapi ruby, classes de dados [por]_
  module Datum
    # _[por] Conteiner de coleções de dados [por]_
    # @see https://github.com/Shopify/liquid/wiki/Introduction-to-Drops
    # @see https://github.com/jekyll/jekyll/blob/master/lib/jekyll/drops/jekyll_drop.rb
    class HapiDrop < Liquid::Drop
      attr_accessor :argumentum

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

      def api
        @optionem['api']
      end

      def api_xdefallo
        @optionem['api_xdefallo']
      end

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
          if @optionem[clavem].length.positive?
            optionem_explanandum.append("'#{clavem}' => '#{@optionem[clavem].length} dēscendēns'")
          else
            optionem_explanandum.append("'#{clavem}' => 'deprædantes pupillos'")
          end
        end

        # puts @optionem['api_gid_xdefallo']
        # optionem_explanandum.append(@optionem['api_gid_xdefallo'].to_s)
        # optionem_explanandum.append(@optionem['api_gid_xdefallo'].to_s)

        # "#{HapiDrop} @item=#{@optionem.keys} #{optionem_num}"
        "#{HapiDrop} @item=[#{optionem_explanandum.join(', ')}]"
      end

      def scheman
        @optionem['scheman']
      end

      def pittacium
        @optionem['pittacium']
      end
    end

    # # class Collectionem < Liquid::Drop
    # class Collectionem < Jekyll::Drops::Drop
    #   attr_accessor :api, :api_xdefallo, :categoriam, :scheman, :pittacium

    #   #   @api = argumentum['api']
    #   #   @api_xdefallo = argumentum['api_xdefallo']
    #   #   @categoriam = argumentum['categoriam']
    #   #   @scheman = argumentum['scheman']
    #   #   @pittacium = argumentum['pittacium']

    #   #   # super
    #   # end

    #   attr_reader :api

    #   def inspect
    #     # Liquid uses 'self.class.to_s'
    #     # @see https://github.com/Shopify/liquid/blob/master/lib/liquid/drop.rb#L47
    #     require 'json'
    #     JSON.pretty_generate(self)
    #   end

    #   def to_liquid
    #     self
    #   end
    # end

    # _[por] Conteiner de dados de uma tag L10n [por]_
    class L10nTag
      attr_accessor :crudum, :fontem_linguam, :objectivum_linguam,
                    :fontem_textum, :venandum_insectum_est, :sos_est,
                    :contextum_archivum_extensionem, :objectivum_textum,
                    :contextum_linguam, :contextum_sos, :paratum_est,
                    :contextum_url, :alternandum_textum, :alternandum_linguam,
                    :textum_solum_est, :contextum_textum_solum_est

      # :initiale_processum

      def initialize(argumentum = {}) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
        # puts "antes"
        # puts initiale_datum
        optionem = initiale_datum.merge(argumentum)

        # @crudum = optionem.fetch(:crudum)
        @contextum_archivum_extensionem = optionem['contextum_archivum_extensionem']
        @contextum_linguam = optionem['contextum_linguam']
        @contextum_sos = optionem['contextum_sos']
        @crudum = optionem['crudum']
        # @tag_nomen = optionem.fetch(:tag_nomen)
        # @fontem_linguam = optionem.fetch(:fontem_linguam)
        @fontem_linguam = optionem['fontem_linguam']
        @alternandum_linguam = optionem['alternandum_linguam']
        # @fontem_bcp47 = optionem['fontem_bcp47']
        @objectivum_linguam = optionem['objectivum_linguam']
        # @objectivum_bcp47 = optionem['objectivum_bcp47']
        @fontem_textum = optionem['fontem_textum']
        @venandum_insectum_est = optionem['venandum_insectum_est']
        @sos_est = optionem['sos_est']
        @contextum_textum_solum_est = optionem['contextum_textum_solum_est']
        @textum_solum_est = optionem['textum_solum_est']
        @contextum_url = optionem['contextum_url']
        # @initiale_processum = optionem['initiale_processum']
        @paratum_est = optionem['paratum_est']

        puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] self [#{inspect}]" if @sos_est || @contextum_sos
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] optionem.fetch(:fontem_linguam) [#{optionem.fetch(:fontem_linguam)}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] optionem.fetch('fontem_textum') [#{optionem.fetch('fontem_textum')}]"
      end

      def initiale_datum # rubocop:disable Metrics/MethodLength
        {
          # @exemplum {% _🗣️ 📝por-Latn📝 👁️spa-Latn👁️ Idioma español (Alfabeto latino) 👁️spa-Latn👁️ 📝por-Latn📝 🗣️_ %}
          crudum: nil,
          # @exemplum _🗣️
          # tag_nomen: nil, # TODO: deprecated
          # @exemplum spa-Latn
          fontem_linguam: nil,
          fontem_bcp47: nil,
          # @exemplum por-Latn
          objectivum_linguam: nil,
          # @exemplum Idioma español (Alfabeto latino)
          fontem_textum: nil,
          objectivum_textum: nil,
          # objectivum_bcp47: nil,
          alternandum_textum: nil,
          alternandum_linguam: nil,
          contextum_archivum_extensionem: '.html', # .csv, .json, ...
          contextum_linguam: nil, # .csv, .json, ...
          contextum_sos: nil,
          # contextum_htmldir: nil,
          # objectivum_htmldir: nil,
          # alternandum_htmldir: nil,
          # fontem_htmldir: nil,
          venandum_insectum_est: false,
          contextum_textum_solum_est: nil,
          textum_solum_est: nil,
          sos_est: false,
          contextum_url: nil,
          # initiale_processum: nil,
          paratum_est: false
        }
      end

      def est_html?
        @contextum_archivum_extensionem == '.html'
      end

      # Trivia:
      # - 'est'
      #   - https://en.wiktionary.org/wiki/est#Latin
      # - 'idem'
      #   - https://en.wiktionary.org/wiki/idem#Latin
      # - 'linguam'
      #   - https://en.wiktionary.org/wiki/lingua#Latin
      # - 'contextum'
      #   - https://en.wiktionary.org/wiki/contextus#Latin
      def est_idem_linguam_contextum?
        @contextum_linguam == if @objectivum_textum.nil?
                                @fontem_linguam
                              else
                                @objectivum_linguam
                              end
      end

      # Trivia:
      # - 'est'
      #   - https://en.wiktionary.org/wiki/est#Latin
      # - 'SOS'
      #   - https://en.wiktionary.org/wiki/venor#Latin
      def est_sos?
        @sos_est || @contextum_sos
      end

      # Trivia:
      # - 'est'
      #   - https://en.wiktionary.org/wiki/est#Latin
      # - 'textum'
      #   - https://en.wiktionary.org/wiki/textus#Latin
      # - 'sōlum'
      #   - https://en.wiktionary.org/wiki/solus#Latin
      def est_textum_solum_est?
        @textum_solum_est || @contextum_textum_solum_est
      end

      # _[lat] Est venandum insectum? [lat]_
      # _[por] Modo depuração de erros? [por]_
      #
      # Trivia:
      # - 'est'
      #   - https://en.wiktionary.org/wiki/est#Latin
      # - 'vēnandum'
      #   - https://en.wiktionary.org/wiki/venor#Latin
      # - 'īnsectum'
      #   - https://en.wiktionary.org/wiki/insectum#Latin
      # - 'Q845566'
      #   - https://www.wikidata.org/wiki/Q845566
      def est_venandum_insectum?
        @venandum_insectum_est
      end
    end

    class Linguam
      attr_accessor :bcp47, :htmldir, :iso6391, :iso15924, :linguam, :macro_est

      # :referens

      def initialize(argumentum = {})
        optionem = initiale_datum.merge(argumentum)

        @linguam = optionem['linguam']

        unless @linguam.nil?
          referens = optionem['referens']
          @iso15924 = Utilitatem.iso15924_de_linguam(@linguam)
          @iso6391 = Utilitatem.iso6391_de_linguam(@linguam, referens['praeiudico'])
          @bcp47 = @iso6391
          @htmldir = Utilitatem.praeiudico_htmldir_de_linguam(@linguam, referens['praeiudico'])
        end

        # TODO: linguam.zzz-Zzzz.BCP47
        # TODO: linguam.zzz-Zzzz.hxl.attributum

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] self [#{inspect}]"
      end

      def initiale_datum
        {
          bcp47: nil,
          htmldir: nil,
          iso6391: nil,
          iso15924: nil,
          linguam: nil,
          macro_est: false
        }
      end

      # @see https://www.rubyguides.com/2017/03/ruby-equality/
      def ==(other)
        @linguam == other.linguam
        # self.name  == other.name &&
        # self.price == other.price
      end

      # def to_s
      #   "#{@linguam} #{@iso6391}"
      # end
    end
  end

  class MembersDrop < Liquid::Drop
    def before_method(method)
      user = User.find_by_name(method)
      user ? UserDrop.new(user) : nil
    end
  end
end

# module Jekyll
#   module Drops
#     # ...
#     class HapiDrop < Liquid::Drop
#       attr_accessor :api, :api_xdefallo, :categoriam, :scheman, :pittacium

#       class << self
#         def global
#           @global ||= HapiDrop.new
#         end
#       end

#       # Create a new Drop
#       #
#       # obj - the Jekyll Site, Collection, or Document required by the
#       # drop.
#       #
#       # Returns nothing
#         @obj = obj
#       end

#       def api
#         @obj.api
#       end

#       def version
#         Jekyll::VERSION
#       end

#       def environment
#         Jekyll.env
#       end

#       def inspect
#         # puts 'datum'
#         # puts @datum

#         # "#<#{self.class} @relative_path=#{relative_path.inspect} xdefallo=#{@trivum}>"
#         # "#<#{self.class} @uid=#{@uid} xdefallo=#{@xdefallo}>"
#         "#<#{self.class}>"
#       end

#       # Generates a list of keys with user content as their values.
#       # This gathers up the Drop methods and keys of the mutations and
#       # underlying data hashes and performs a set union to ensure a list
#       # of unique keys for the Drop.
#       #
#       # Returns an Array of unique keys for content for the Drop.
#       def keys
#         ['api']
#       end

#       # Generate a Hash representation of the Drop by resolving each key's
#       # value. It includes Drop methods, mutations, and the underlying object's
#       # data. See the documentation for Drop#keys for more.
#       #
#       # Returns a Hash with all the keys and values resolved.
#       def to_h
#         # keys.each_with_object({}) do |(key, _), result|
#         #   result[key] = self[key]
#         # end
#         @obj
#       end
#       alias to_hash to_h

#       # def to_h
#       #   @to_h ||= {
#       #     'version' => version,
#       #     'environment' => environment
#       #   }
#       # end

#       def to_json(state = nil)
#         JSON.generate(to_h, state)
#       end
#     end
#   end
# end
