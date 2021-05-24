# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# trānslātiōnem, https://en.wiktionary.org/wiki/translatio#Latin
# frozen_string_literal: true

# rubocop:disable Style/GlobalVars

# HapiApi is (TODO: document)
module HapiApi
  @datum = $DATUM

  # HapiApiGenerator is (TODO: document)
  class Translationem < Liquid::Tag
    # def initialize(tag_name, text, tokens)
    #   super
    #   tokens = text.split

    #   @text = tokens.shift
    # end
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
      # @datum = 123
    end

    def datum_temporarium(context)
      context['site']['data']['Temporarium']
    end

    def datum_temporarium_suffix(context)
      @resultatum = []

      # exemplum: por-Latn
      if context['page']['linguam']
        # exemplum: _por-Latn
        @resultatum.append("_#{context['page']['linguam']}")
        # @resultatum.append("_#{context['page']['linguam']}")
        @parts = context['page']['linguam'].split('-')

        # exemplum = _por
        @resultatum.append("_#{@parts.shift}")

        # exemplum = _Latn
        # if @parts
        #   @resultatum.append("_#{@parts.shift}") if @parts
        # end
        @resultatum.append("_#{@parts.shift}") if @parts
      end

      @resultatum
    end

    # TODO: esta meio feio isso. Melhorar
    def de_markdown(text)
      require "kramdown"
      "#{Kramdown::Document.new(text).to_html}"
    end

    def render(context)
      temp = datum_temporarium(context)

      # puts context
      # # puts context.site
      # puts context['site']
      # puts context['site']['data']['Temporarium']
      # puts context['site']['data']['Temporarium']['Temp_hapi_api_aviso_de_isencao_por']
      # puts temp['Temp_hapi_api_aviso_de_isencao_por']

      return temp[@text] if temp && temp[@text]

      suffixes = datum_temporarium_suffix(context)

      suffixes.each do |suffix|
        # puts ">#{@text}<"
        # puts "#{@text}#{suffix}"
        return de_markdown(temp["#{@text}#{suffix}"]) if temp && temp["#{@text}#{suffix}"]
      end

      # TODO: _[por] implementar _data/L10n.hxl.csv [por]_

      "!?[gettext[#{@text}]gettext]?!"
    end
  end
end

# Liquid::Template.register_filter(HapiApi::Translationem)

Liquid::Template.register_tag('gettext', HapiApi::Translationem)
