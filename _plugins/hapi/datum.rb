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
                    :fontem_textum, :venandum_insectum_est, :sos_est

      def initialize(argumentum = {})
        optionem = initiale_datum.merge(argumentum)

        # puts "\n\n\t[🔎🐛 #{self.class.name}] @argumentum [#{argumentum.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] initiale_datum [#{initiale_datum.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] result [#{optionem.inspect}]"

        @crudum = optionem.fetch(:crudum)
        # @tag_nomen = optionem.fetch(:tag_nomen)
        @fontem_linguam = optionem.fetch(:fontem_linguam)
        @objectivum_linguam = optionem.fetch(:objectivum_linguam)
        @fontem_textum = optionem.fetch(:fontem_textum)
        @venandum_insectum_est = optionem.fetch(:venandum_insectum_est)
        @sos_est = optionem.fetch(:sos_est)

        # puts "\n\n\t[🔎🐛 #{self.class.name}] self [#{inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] self [#{inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] optionem.fetch(:fontem_linguam) [#{optionem.fetch(:fontem_linguam)}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] optionem.fetch('fontem_textum') [#{optionem.fetch('fontem_textum')}]"
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
          venandum_insectum_est: false,
          sos_est: false
        }
      end
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
