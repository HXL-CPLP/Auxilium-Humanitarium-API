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

      def initialize(argumentum = {})

        # puts "antes"
        # puts initiale_datum
        optionem = initiale_datum.merge(argumentum)
        # puts "depis"
        # puts optionem

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @class keys [#{argumentum.keys}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @class [#{argumentum.class}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @class  initiale_datum [#{initiale_datum.class}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @class  initiale_datum keys [#{initiale_datum.keys}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @argumentum [#{argumentum.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] initiale_datum [#{initiale_datum.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] result [#{optionem.inspect}]"

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @sssssssssssssssss [#{argumentum['fontem_textum'].inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @sssssssssssssssss [#{argumentum.fetch(:fontem_textum).inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @sssssssssssssssss [#{optionem.fetch(:crudum).inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @sssssssssssssssss [#{optionem.fetch(:crudum).inspect}]"

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

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] self [#{inspect}]"

        # puts "final"
        # puts argumentum['crudum']
        # puts initiale_datum['crudum'].inspect
        # puts optionem['crudum'].inspect
        # puts @crudum
        # puts @fontem_linguam
        # puts 'fin'
        puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] self [#{inspect}]" if @sos_est || @contextum_sos
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] optionem.fetch(:fontem_linguam) [#{optionem.fetch(:fontem_linguam)}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] optionem.fetch('fontem_textum') [#{optionem.fetch('fontem_textum')}]"
      end

      def initiale_datum
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
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
