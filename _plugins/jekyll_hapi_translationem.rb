# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# trānslātiōnem, https://en.wiktionary.org/wiki/translatio#Latin
# frozen_string_literal: true

# _[lat] Hapi est programma de Auxilium Humanitarium API documentōrum. [lat]_
module Hapi
  # _[lat] Hapi.Translationem de Auxilium Humanitarium API documentōrum. [lat]_
  module Translationem
    module_function

    def datum_l10n(l10n_codice, context, linguam = nil)
      linguam = linguam.nil? ? context['page']['linguam'] : linguam
      hxlattrs = context['site']['data']['referens']['linguam'][linguam]['hxlattrs']
      # puts linguam
      # puts hxlattrs
      # puts context['site']['data']['L10nhxl']
      context['site']['data']['L10nhxl'].each do |line|
        # if line['#item+code'] == l10n_codice
        next if line['#item+code'] != l10n_codice

        hxlattrs.each do |hxlattr|
          # puts hxlattr
          next unless line["#item+l10n#{hxlattr}"]

          # puts hxlattr
          # puts line["#item+l10n#{hxlattr}"]

          return line["#item+l10n#{hxlattr}"]
        end
      end

      nil
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

    def de(text)
      # print @tokens
      # print @variant1
      return de_markdown(text) if @variant1 && @variant1 == 'de_markdown'

      text
    end

    # @see https://iso639-3.sil.org/code_tables/639/data
    # @see https://www.wikidata.org/wiki/Property:P220
    def iso6393_de_linguam(linguam)
      return linguam unless linguam.length != 3

      @parts = linguam.split('-')

      return @parts[0] unless @parts[0].length != 3

      nil
    end

    # @see https://www.wikidata.org/wiki/Property:P506
    # @see https://unicode.org/iso15924/iso15924-codes.html
    def iso15924_de_linguam(linguam)
      return nil if linguam.length < 4

      # return nil unless linguam.length != 3

      @parts = linguam.split('-')

      return nil if @parts[1].nil?

      # return @parts[1].capitalize if @parts[1].length == 4
      return @parts[1] if @parts[1].length == 4

      nil
    end

    # _[por] Forma preconceituosa de assumir script do idioma. Note que vários
    #        idiomas podem ser escritos em mais de um alfabeto (e isso ocorre
    #        com frequência línguas que não usam latin.)
    # [por]_
    # Trivia:
    # - 'praeiudico'
    #   - https://en.wiktionary.org/wiki/praeiudico
    #     - https://en.wiktionary.org/wiki/prejudge
    def praeiudico_iso15924_de_iso6393(iso6393, _referens_praeiudico)
      return nil if iso6393.length != 3
    end

    # TODO: esta meio feio isso. Melhorar. Um problema é que cria
    #       tags <p> mesmo em elementos inline.
    # @deprecated
    def de_markdown(text)
      require 'kramdown'
      Kramdown::Document.new(text).to_html.to_s
    end

    # HapiApiGenerator is (TODO: document)
    class DeLatCodicem < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        @text = @tokens.shift
        @variant1 = @tokens.shift if @tokens
        # @datum = 123
      end

      def render(context)
        temp = Translationem.datum_temporarium(context)
        l10nval = Translationem.datum_l10n(@text, context)

        return l10nval if l10nval

        return temp[@text] if temp && temp[@text]

        suffixes = Translationem.datum_temporarium_suffix(context)

        suffixes.each do |suffix|
          return Translationem.de(temp["#{@text}#{suffix}"]) if temp && temp["#{@text}#{suffix}"]
        end

        "!?[gettext[#{@text}]gettext]?!"
      end
    end

    # HapiApiGenerator is (TODO: document)
    class DeLatCodicemIn < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        @linguam = @tokens.shift
        @textum = @tokens.shift

        puts @linguam

        @iso6393 = Translationem.iso6393_de_linguam(@linguam)
        @iso15924 = Translationem.iso15924_de_linguam(@linguam)
        # @datum = 123
      end

      def render(_context)
        puts 'oioi1'
        puts @textum
        puts 'oioi1'
        puts 'oioi2'
        puts @iso6393
        puts 'oioi2'
        puts 'oioi2'
        puts @iso15924
        puts 'oioi2'

        # temp = Translationem.datum_temporarium(context)
        # l10nval = Translationem.datum_l10n(@text, context)

        # return l10nval if l10nval

        # return temp[@text] if temp && temp[@text]

        # suffixes = Translationem.datum_temporarium_suffix(context)

        # suffixes.each do |suffix|
        #   return Translationem.de(temp["#{@text}#{suffix}"]) if temp && temp["#{@text}#{suffix}"]
        # end

        "!?[gettext[#{@text}]gettext]?!"
      end
    end

    # _[eng] Generate HTML from markdown inside this block [eng]_
    # @exemplum Primum exemplum
    #   {% de_markdown %}
    #     Referens: [HXLStandard](https://hxlstandard.org/).
    #   {% endde_markdown %}
    #
    # @resultatum Primum exemplum
    #   <p>Referens: <a href="https://hxlstandard.org/">HXLStandard</a>.</p>
    #
    # @exemplum Secundum exemplum
    #   {% de_markdown %}
    #     {% de_eng Referens: [HXLStandard](https://hxlstandard.org/). %}
    #   {% endde_markdown %}
    #
    # @resultatum Secundum exemplum
    #   <p>Referens: <a href="https://hxlstandard.org/">HXLStandard</a>.</p>
    #
    class DeMarkdownBlock < Liquid::Block
      def render(context)
        text = super
        # "<p>#{text} #{Time.now}</p>"
        require 'kramdown'
        Kramdown::Document.new(text).to_html.to_s
      end
    end
  end
end

# Liquid::Template.register_filter(HapiApi::Translationem)

# Liquid::Template.register_tag('gettext', HapiApi::TranslationemDeLatCodicem)
Liquid::Template.register_tag('de_lat_codicem', Hapi::Translationem::DeLatCodicem)

Liquid::Template.register_tag('de_lat_codicem_in', Hapi::Translationem::DeLatCodicemIn)

Liquid::Template.register_tag('de_markdown', Hapi::Translationem::DeMarkdownBlock)
