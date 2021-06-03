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
    # _[por] Conteiner de dados de uma tag L10n [por]_
    class L10nTag
      attr_accessor :crudum, :fontem_linguam, :objectivum_linguam,
                    :fontem_textum, :venandum_insectum_est, :sos_est,
                    :contextum_archivum_extensionem,
                    :contextum_linguam, :contextum_sos, :paratum_est,
                    :contextum_url

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
        @objectivum_linguam = optionem['objectivum_linguam']
        @fontem_textum = optionem['fontem_textum']
        @venandum_insectum_est = optionem['venandum_insectum_est']
        @sos_est = optionem['sos_est']
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
          # @exemplum por-Latn
          objectivum_linguam: nil,
          # @exemplum Idioma español (Alfabeto latino)
          fontem_textum: nil,
          contextum_archivum_extensionem: '.html', # .csv, .json, ...
          contextum_linguam: nil, # .csv, .json, ...
          contextum_sos: nil,
          venandum_insectum_est: false,
          sos_est: false,
          contextum_url: nil,
          # initiale_processum: nil,
          paratum_est: false
        }
      end

      # Trivia:
      # - 'est'
      #   - https://en.wiktionary.org/wiki/est#Latin
      # - 'SOS'
      #   - https://en.wiktionary.org/wiki/venor#Latin
      def est_sos?
        @sos_est || @contextum_sos
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
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
