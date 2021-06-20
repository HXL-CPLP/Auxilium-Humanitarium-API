# ARCHĪVUM:        _plugins/hapi/datum.rb
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

    # _[por] Conteiner de dados de uma tag L10n [por]_
    class L10nTag
      attr_accessor :crudum, :fontem_linguam, :objectivum_linguam,
                    :fontem_textum, :venandum_insectum_est, :sos_est,
                    :contextum_archivum_extensionem, :objectivum_textum,
                    :contextum_linguam, :contextum_sos, :paratum_est,
                    :contextum_url, :alternandum_textum, :alternandum_linguam,
                    :textum_solum_est, :contextum_textum_solum_est,
                    :alternandum_linguam_neo

      # :initiale_processum

      def initialize(argumentum = {}) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
        # puts "antes"
        # puts initiale_datum
        optionem = initiale_datum.merge(argumentum)

        # @crudum = optionem.fetch(:crudum)
        @contextum_archivum_extensionem = optionem['contextum_archivum_extensionem']
        @contextum_linguam = optionem['contextum_linguam'] # TODO: replace contextum_linguam with l10n_ego_linguam
        @l10n_ego_linguam = optionem['l10n_ego_linguam']
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
          contextum_linguam: nil,
          l10n_ego_linguam: nil, # TODO: replace contextum_linguam with l10n_ego_linguam
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
        @contextum_archivum_extensionem.end_with?('html')
      #  false
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
        # TODO: replace contextum_linguam with l10n_ego_linguam
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
      # def initialize(linguam)
        optionem = initiale_datum.merge(argumentum)

        # @linguam = linguam
        @linguam = optionem['linguam']


        unless @linguam.nil?
          # referens = optionem['referens']
          referens = Hapi::HSD.data?['referens']
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

end
