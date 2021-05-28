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
      # TODO: _[por] Implementar mensagem de erro se usuário errar linguam
      #              como usar 'linguam: por' em vez de 'linguam: por-Latn'
      #       [por]_
      hxlattrs = context['site']['data']['referens']['linguam'][linguam]['hxlattrs']
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

    def datum_l10n_de_textum(textum, context, linguam_fontem, linguam_objectivum = nil)
      linguam_objectivum = linguam_objectivum.nil? ? context['page']['linguam'] : linguam_objectivum
      hxlattrs_fontem = context['site']['data']['referens']['linguam'][linguam_fontem]['hxlattrs']
      hxlattrs_objectivum = context['site']['data']['referens']['linguam'][linguam_objectivum]['hxlattrs']

      # puts 'datum_l10n_de_textum'
      # puts 'linguam_fontem ' + linguam_fontem
      # puts 'linguam_objectivum ' + linguam_objectivum
      # puts 'hxlattrs_fontem ' + hxlattrs_fontem.to_s
      # puts 'hxlattrs_objectivum ' + hxlattrs_objectivum.to_s

      # puts hxlattrs
      # puts context['site']['data']['L10nhxl']
      context['site']['data']['L10nhxl'].each do |line|
        # if line['#item+code'] == l10n_codice
        # puts "#item+l10n#{hxlattrs_fontem}"

        hxlattrs_fontem.each do |hxlattr_fon|
          next if line["#item+l10n#{hxlattr_fon}"] != textum

          hxlattrs_objectivum.each do |hxlattr_obj|
            # puts hxlattr
            next unless line["#item+l10n#{hxlattr_obj}"]

            # puts hxlattr
            # puts line["#item+l10n#{hxlattr}"]

            return line["#item+l10n#{hxlattr_obj}"]
          end
        end
      end

      nil
    end

    def datum_temporarium(context)
      context['site']['data']['Temporarium']
    end

    def datum_temporarium_suffix(context, linguam = nil)
      linguam = linguam.nil? ? context['page']['linguam'] : linguam
      @resultatum = []

      # exemplum: por-Latn
      # if context['page']['linguam']
      # exemplum: _por-Latn
      @resultatum.append("_#{linguam}")
      # @resultatum.append("_#{context['page']['linguam']}")
      @parts = linguam.split('-')

      # exemplum = _por
      @resultatum.append("_#{@parts.shift}")

      # exemplum = _Latn
      # if @parts
      #   @resultatum.append("_#{@parts.shift}") if @parts
      # end
      @resultatum.append("_#{@parts.shift}") if @parts
      # end

      # puts @resultatum

      @resultatum
    end

    def de(text)
      # print @tokens
      # print @variant1
      return de_markdown(text) if @variant1 && @variant1 == 'de_markdown'

      text
    end

    # TODO: esta meio feio isso. Melhorar. Um problema é que cria
    #       tags <p> mesmo em elementos inline.
    # @deprecated
    def de_markdown(text)
      require 'kramdown'
      Kramdown::Document.new(text).to_html.to_s
    end

    # @see https://iso639-3.sil.org/code_tables/639/data
    # @see https://www.wikidata.org/wiki/Property:P220
    def iso6393_de_linguam(linguam)
      return linguam unless linguam.length != 3

      @parts = linguam.split('-')

      return @parts[0] unless @parts[0].length != 3

      nil
    end

    # @see https://iso639-3.sil.org/code_tables/639/data
    # @see https://www.wikidata.org/wiki/Property:P220
    def iso6391_de_linguam(linguam, referens_praeiudico)
      return nil if linguam.length != 8

      @parts = linguam.split('-')

      return nil if @parts[0].nil? || @parts[0].length != 3

      @iso6393 = @parts[0]

      # return nil if referens_praeiudico['iso3693'].nil?
      return nil if referens_praeiudico['iso3693'][@iso6393].nil?
      return nil if referens_praeiudico['iso3693'][@iso6393]['iso6391'].nil?

      referens_praeiudico['iso3693'][@iso6393]['iso6391']
    end

    # @see https://www.wikidata.org/wiki/Property:P506
    # @see https://unicode.org/iso15924/iso15924-codes.html
    def iso15924_de_linguam(linguam)
      return nil if linguam.length < 4

      @parts = linguam.split('-')

      return nil if @parts[1].nil?

      return @parts[1] if @parts[1].length == 4

      nil
    end

    # _[eng] what page.linguam temos no contexto? [eng]_
    # _[lat] Quod Jekyll page.linguam nunc? [lat]_
    # _[por] Qual page.linguam temos no contexto? [por]_
    #
    # @exemplum Exemplum I
    #   linguam = por-Latn
    #   ---
    #   puts Translationem.quod_linguam_nunc(context)
    # @resultatum Exemplum I
    #   por-Latn
    def quod_linguam_nunc(context)
      context['page']['linguam']
    end

    # _[eng] Which HTML markup to add for this text, if not same as the page? [eng]_
    # _[lat] Quod HTML5 markup nunc? [lat]_
    # _[por] Quais atributos HTML adicionar para este elemento, se diferente da página? [por]_
    #
    def quod_html_markup_nunc(textum_signif, contextum_signif)
      @attrs = []

      # puts "textum_signif [#{textum_signif}] \ncontextum_signif [#{contextum_signif}]"
      @attrs.append("lang='#{textum_signif['iso6391']}'") if textum_signif['iso6391'] != contextum_signif['iso6391']
      @attrs.append("dir='#{textum_signif['htmldir']}'") if textum_signif['htmldir'] != contextum_signif['htmldir']
      @markup = @attrs.append('class=\'incognitum-phrasim\'').join(' ') if @attrs.length.positive?

      @markup
    end

    # _[por] Forma preconceituosa de assumir direção de escrita apenas pelo
    #        idioma ISO 639-3 + sistema de escrita ISO 15924.
    # [por]_
    #
    # @exemplum Exemplum I
    #   Translationem.praeiudico_htmldir_de_linguam('por-Latn', referens_praeiudico)
    # @resultatum Exemplum I
    #   ltr
    #
    # @exemplum Exemplum II
    #   Translationem.praeiudico_htmldir_de_linguam('ara-Arab', referens_praeiudico)
    # @resultatum Exemplum II
    #   rtl
    #
    # Trivia:
    # - 'praeiudico'
    #   - https://en.wiktionary.org/wiki/praeiudico
    #     - https://en.wiktionary.org/wiki/prejudge
    # - https://en.wikipedia.org/wiki/Linguistic_discrimination
    def praeiudico_htmldir_de_linguam(linguam, referens_praeiudico)
      return nil if linguam.length != 8

      @parts = linguam.split('-')

      return nil if @parts[0].nil? || @parts[0].length != 3

      # return nil if referens_praeiudico['iso3693'].nil?
      return nil if referens_praeiudico['iso3693'][@parts[0]].nil?
      return nil if referens_praeiudico['iso3693'][@parts[0]]['htmldir'].nil?

      referens_praeiudico['iso3693'][@parts[0]]['htmldir']
    end

    # _[por] Forma preconceituosa de assumir script do idioma. Note que vários
    #        idiomas podem ser escritos em mais de um alfabeto (e isso ocorre
    #        com frequência línguas que não usam latin.)
    # [por]_
    #
    # @exemplum Exemplum I
    #   Translationem.praeiudico_iso15924_de_iso6393('por', referens_praeiudico)
    # @resultatum Exemplum I
    #   Latn
    #
    # Trivia:
    # - 'praeiudico'
    #   - https://en.wiktionary.org/wiki/praeiudico
    #     - https://en.wiktionary.org/wiki/prejudge
    # - https://en.wikipedia.org/wiki/Linguistic_discrimination
    def praeiudico_iso15924_de_iso6393(iso6393, referens_praeiudico)
      return nil if iso6393.length != 3
      return nil if referens_praeiudico['iso3693'].nil?
      return nil if referens_praeiudico['iso3693'][iso6393].nil?
      return nil if referens_praeiudico['iso3693'][iso6393]['iso15924'].nil?

      referens_praeiudico['iso3693'][iso6393]['iso15924']
    end

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength

    # Trivia:
    # - 'significātiōnem'
    #   - https://en.wiktionary.org/wiki/significatio
    # - 'incognitum'
    #   - https://en.wiktionary.org/wiki/incognitus#Latin
    # - 'pūrum'
    #   - https://en.wiktionary.org/wiki/purus#Latin
    # - 'orīgināle'
    #   - https://en.wiktionary.org/wiki/originalis#Latin
    # - 'htmldir'
    #   - https://www.w3.org/International/questions/qa-html-dir
    def significationem_incognitum_textum(textum, context)
      # @see https://regexr.com/
      @regex = textum.scan(/<!--\[(?:.)*?\[(?:.)*?\](?:.)*?\]-->/)

      # @see https://rollbar.com/guides/ruby-raising-exceptions/
      if @regex.length != 2
        # raise StandardError.new "IncognitumPhrasimEstBlock ERROR! regex [#{@testum}] text #{@@testum}"
        raise "IncognitumPhrasimEstBlock ERROR! regex [#{@textum}] text #{@@textum}"
      end

      @linguam_fontem = @regex[0].gsub('<!--[de_linguam:[', '').gsub(']]-->', '')

      {
        'textum_originale' => textum,
        'textum_purum' => textum.gsub(@regex[0], '').gsub(@regex[1], ''),
        'linguam' => @linguam_fontem,
        'iso6391' => Translationem.iso6391_de_linguam(
          @linguam_fontem, context['site']['data']['referens']['praeiudico']
        ),
        'htmldir' => Translationem.praeiudico_htmldir_de_linguam(
          @linguam_fontem, context['site']['data']['referens']['praeiudico']
        )
      }
    end

    def translationem_memoriam_collectionem(contextum)
      # puts 'test'
      puts contextum['site']['data']['tm'].keys
    end

    def translationem_memoriam_rememorandum(codicem, linguam, contextum)
      tm_collectionem = translationem_memoriam_collectionem(contextum)

      # puts 'test'
      # puts contextum['site']['data'].keys
    end

    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize

    # Trivia:
    # - 'significātiōnem'
    #   - https://en.wiktionary.org/wiki/significatio
    # - 'contextum'
    #   - https://en.wiktionary.org/wiki/contextus#Latin
    # - 'htmldir'
    #   - https://www.w3.org/International/questions/qa-html-dir
    #   - https://www.w3.org/International/articles/inline-bidi-markup/
    def significationem_contextum(contextum)
      {
        'linguam' => contextum['page']['linguam'], # Exemplum: por-Latn
        'htmldir' => contextum['page']['htmldir'], # Exemplum: ltr
        'iso6391' => contextum['page']['iso6391'], # Exemplum: pt
        'iso6393' => contextum['page']['iso6393'], # Exemplum: por
        'iso15924' => contextum['page']['iso15924'] # Exemplum: Latn
      }
    end

    # _[eng] The {% de_lat_codicem (...) %} implementation [eng]_
    # _[por] A implementação de {% de_lat_codicem (...) %} [por]_
    #
    # @exemplum Primum exemplum
    #   linguam: por-Latn
    #   ---
    #   {% de_lat_codicem licentiam_nomen %}
    # @resultatum Primum exemplum
    #   Licença
    class DeLatCodicem < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        @textum = @tokens.shift
        @variant1 = @tokens.shift if @tokens
        # @datum = 123
      end

      def render(context)
        temp = Translationem.datum_temporarium(context)
        l10nval = Translationem.datum_l10n(@textum, context)

        return l10nval if l10nval

        return temp[@textum] if temp && temp[@textum]

        suffixes = Translationem.datum_temporarium_suffix(context)

        suffixes.each do |suffix|
          # puts "#{@text}#{suffix}"
          # puts temp["#{@text}#{suffix}"]
          # return Translationem.de(temp["#{@textum}#{suffix}"]) if temp && temp["#{@textum}#{suffix}"]
          return temp["#{@textum}#{suffix}"] if temp && temp["#{@textum}#{suffix}"]
        end

        "<!--[de_linguam:[lat-Latn]]-->#{@textum}<!--[[lat-Latn]:de_linguam]-->"
      end
    end

    # _[por]  Converte '#item +id' da coleção de memórias de tradução para
    #         o idioma requisitado pelo contexto da página atual.
    #         Para simplificar documentação com uso em sistemas de escrita
    #         direita-para-esquerda intencionamente tanto início como
    #         final do método repetem a função.
    #         Ou seja:
    #         {% _ TERMO _ %}
    #         {% __ TERMO __ %}
    #         {% ___ TERMO ___ %}
    # [por]_
    #
    # @exemplum Primum exemplum
    #   linguam: por-Latn
    #   ---
    #   {% _ dominium_publicum_nomen _ %}
    # @resultatum Primum exemplum
    #   Domínio público
    class DeL10n < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        # @linguam_fontem = @tokens.shift
        @textum = @tokens.shift

        # @iso6393 = Translationem.iso6393_de_linguam(@linguam_fontem)
        # @iso15924 = Translationem.iso15924_de_linguam(@linguam_fontem)
      end

      def render(context)
        temp = Translationem.datum_temporarium(context)
        # l10nval = Translationem.datum_l10n(@textum, context, @linguam_fontem)
        l10nval = nil

        Translationem.translationem_memoriam_collectionem(context)

        return l10nval if l10nval

        return temp[@textum] if temp && temp[@textum]

        suffixes = Translationem.datum_temporarium_suffix(context)

        suffixes.each do |suffix|
          # puts 'oooooooooi'
          # puts suffix
          # puts "#{@textum}#{suffix}"
          # puts temp["#{@textum}#{suffix}"]
          return Translationem.de(temp["#{@textum}#{suffix}"]) if temp && temp["#{@textum}#{suffix}"]
        end

        # "<!--[de_linguam:[#{@linguam_fontem}]]-->#{@textum}<!--[[#{@linguam_fontem}]:de_linguam]-->"
        # "_[#{@linguam_fontem}]#{@textum}[#{@linguam_fontem}]_"
        "#{@textum}"
      end
    end

    # _[eng] The {% de_lat_codicem_in (...) %} implementation [eng]_
    # _[por] A implementação de {% de_lat_codicem_in (...) %} [por]_
    #
    # @exemplum Primum exemplum
    #   {% de_lat_codicem_in por-Latn licentiam_nomen %}
    # @resultatum Primum exemplum
    #   Licença
    class DeLatCodicemIn < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        @linguam_fontem = @tokens.shift
        @textum = @tokens.shift

        # @iso6393 = Translationem.iso6393_de_linguam(@linguam_fontem)
        # @iso15924 = Translationem.iso15924_de_linguam(@linguam_fontem)
      end

      def render(context)
        temp = Translationem.datum_temporarium(context)
        l10nval = Translationem.datum_l10n(@textum, context, @linguam_fontem)

        return l10nval if l10nval

        return temp[@textum] if temp && temp[@textum]

        suffixes = Translationem.datum_temporarium_suffix(context)

        suffixes.each do |suffix|
          # puts 'oooooooooi'
          # puts suffix
          # puts "#{@textum}#{suffix}"
          # puts temp["#{@textum}#{suffix}"]
          return Translationem.de(temp["#{@textum}#{suffix}"]) if temp && temp["#{@textum}#{suffix}"]
        end

        "<!--[de_linguam:[#{@linguam_fontem}]]-->#{@textum}<!--[[#{@linguam_fontem}]:de_linguam]-->"
      end
    end

    # _[eng] The {% de_por_Latn (...) %} implementation [eng]_
    # _[por] A implementação de {% de_por_Latn (...) %} [por]_
    #
    # @exemplum Exemplum I
    #   linguam: por-Latn
    #   # por-Latn 'Frase em português' -> por-Latn ? = nil
    #   ---
    #   {% de_por_Latn Frase em português %}
    # @resultatum Exemplum I
    #   Frase em português
    #
    # @exemplum Exemplum II
    #   linguam: eng-Latn
    #   # por-Latn 'Frase em português' -> eng-Latn ? = nil
    #   ---
    #   {% de_por_Latn Tradução %}
    # @resultatum Exemplum II
    #  <!--de_linguam:por-Latn-->Frase em português<!--por-Latn:de_linguam-->
    #
    # @exemplum Exemplum III
    #   linguam: eng-Latn
    #   # por-Latn 'Tradução' -> eng-Latn ? = Translation
    #   ---
    #   {% de_por_Latn Tradução %}
    # @resultatum Exemplum III
    #   Translation
    #
    class DePorLatn < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @linguam_fontem = 'por-Latn'
        @linguam_objectivum = nil
        @textum = text.strip
      end

      def render(context)
        @linguam_objectivum = Translationem.quod_linguam_nunc(context)

        return @textum unless @linguam_fontem != @linguam_objectivum

        l10nvalextum = Translationem.datum_l10n_de_textum(
          @textum, context, @linguam_fontem, @linguam_objectivum
        )

        return l10nvalextum if l10nvalextum

        "<!--[de_linguam:[#{@linguam_fontem}]]-->#{@textum}<!--[[#{@linguam_fontem}]:de_linguam]-->"
      end
    end

    # _[eng] The {% de_por_Latn_in (...) %} implementation [eng]_
    # _[por] A implementação de {% de_por_Latn_in (...) %} [por]_
    #
    # @exemplum Exemplum I
    #   linguam: por-Latn
    #   # por-Latn 'Frase em português' -> por-Latn ? = nil
    #   ---
    #   {% de_por_Latn_in por-Latn Frase em português %}
    # @resultatum Exemplum I
    #   Frase em português
    #
    # @exemplum Exemplum II
    #   linguam: eng-Latn
    #   # por-Latn 'Frase em português' -> eng-Latn ? = nil
    #   ---
    #   {% de_por_Latn_in eng-Latn Tradução %}
    # @resultatum Exemplum II
    #   <!--de_linguam:por-Latn-->Frase em português<!--por-Latn:de_linguam-->
    #
    # @exemplum Exemplum III
    #   linguam: eng-Latn
    #   # por-Latn 'Tradução' -> eng-Latn ? = Translation
    #   ---
    #   {% de_por_Latn_in eng-Latn Tradução %}
    # @resultatum Exemplum III
    #   Translation
    #
    class DePorLatnIn < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        @linguam_fontem = 'por-Latn'
        @linguam_objectivum = @tokens.shift
        @textum = @tokens.join(' ')

        # puts @linguam_fontem
        # puts @linguam_objectivum

        # @iso6393 = 'por'
        # @iso15924 = 'por-Latn'
      end

      def render(context)
        return @textum unless @linguam_fontem != @linguam_objectivum

        l10nvalextum = Translationem.datum_l10n_de_textum(
          @textum, context, @linguam_fontem, @linguam_objectivum
        )

        return l10nvalextum if l10nvalextum

        "<!--[de_linguam:[#{@linguam_fontem}]]-->#{@textum}<!--[[#{@linguam_fontem}]:de_linguam]-->"
      end
    end

    # _[eng] The {% de_textum (...) %} implementation [eng]_
    # _[por] A implementação de {% de_textum (...) %} [por]_
    #
    # @exemplum Exemplum I
    #   linguam: por-Latn
    #   # por-Latn 'Frase em português' -> por-Latn ? = nil
    #   ---
    #   {% de_textum por-Latn Frase em português %}
    # @resultatum Exemplum I
    #   Frase em português
    #
    # @exemplum Exemplum II
    #   linguam: eng-Latn
    #   # por-Latn 'Frase em português' -> eng-Latn ? = nil
    #   ---
    #   {% de_textum Tradução %}
    # @resultatum Exemplum II
    #  <!--de_linguam:por-Latn-->Frase em português<!--por-Latn:de_linguam-->
    #
    # @exemplum Exemplum III
    #   linguam: eng-Latn
    #   # por-Latn 'Tradução' -> eng-Latn ? = Translation
    #   ---
    #   {% de_textum por-Latn Tradução %}
    # @resultatum Exemplum III
    #   Translation
    #
    class DeTextum < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        @linguam_fontem = @tokens.shift
        @linguam_objectivum = nil
        @textum = @tokens.join(' ')

        @error_text = nil

        # TODO: implementar sistema de ERROR e WARNING se estiver rodando
        #       localmente e se estiver em produção. No caso de produção
        #       tolerar exibindo mensagem de erro em vez de bloquear tudo.
        if @linguam_fontem.length != 8 || @textum.length.zero?
          # warn "WARNING {% de_textum #{text}%}"
          @error_text = "!?ERROR{% #{tag_name} #{text}%}ERROR?!"

          # puts ENV.keys
          if ENV['JEKYLL_ENV'] == 'development'
            raise @error_text
          else
            puts caller
            warn @error_text
          end
          # puts ENV['JEKYLL_ENV']
          # warn @error_text
        end

        # puts 'aaa'
        # puts text

        # validate
      end

      # def errorem
      # def validate
      #   # if @linguam_fontem.length != 8
      #   raise "{% de_textum [LINGUAN ERROR] (...) %} [#{@linguam_fontem}" if @linguam_fontem.length != 8
      #   raise "{% de_textum #{@linguam_fontem} [ERROR] %} [#{@textum}" unless @textum
      #   # raise 'error'
      #   raise "Mensagem de erro aqui tag_name[#{tag_name}] text[#{text}] tokens[#{tokens}]"
      # end

      def render(context)
        return @error_text if @error_text

        @linguam_objectivum = Translationem.quod_linguam_nunc(context)

        return @textum unless @linguam_fontem != @linguam_objectivum

        l10nvalextum = Translationem.datum_l10n_de_textum(
          @textum, context, @linguam_fontem, @linguam_objectivum
        )

        return l10nvalextum if l10nvalextum

        "<!--[de_linguam:[#{@linguam_fontem}]]-->#{@textum}<!--[[#{@linguam_fontem}]:de_linguam]-->"
      end
    end

    # _[eng] Generate HTML from markdown inside this block [eng]_
    # @exemplum Exemplum I
    #   {% de_markdown %}
    #     Referens: [HXLStandard](https://hxlstandard.org/).
    #   {% endde_markdown %}
    #
    # @resultatum Exemplum I
    #   <p>Referens: <a href="https://hxlstandard.org/">HXLStandard</a>.</p>
    #
    # @exemplum Exemplum II
    #   {% de_markdown %}
    #     {% de_eng Referens: [HXLStandard](https://hxlstandard.org/). %}
    #   {% endde_markdown %}
    #
    # @resultatum Exemplum II
    #   <p>Referens: <a href="https://hxlstandard.org/">HXLStandard</a>.</p>
    #
    class DeMarkdownBlock < Liquid::Block
      def render(context)
        text = super
        require 'kramdown'
        Kramdown::Document.new(text).to_html.to_s
      end
    end

    # _[eng] Remove HTML, if any (example: HTML comments of missing
    #         translations)
    # [eng]_
    #
    # @exemplum Exemplum I
    #   {%- de_non_html -%}
    #     <!--de_linguam:por-Latn-->Frase em português<!--por-Latn:de_linguam-->
    #   {%- endde_non_html -%}
    #
    # @resultatum Exemplum I
    #   Frase em português
    #
    class DeNonHtmlBlock < Liquid::Block
      def render(context)
        text = super
        require 'nokogiri'
        doc = Nokogiri::HTML::DocumentFragment.parse(text)
        doc.xpath('text()')
      end
    end

    # _[eng] This is the {% incognitum_phrasim_est}(...){% %} implementation eng]_
    # _[por] Implementação do {% incognitum_phrasim_est %} (...){% %} [por]_
    #
    # @exemplum Exemplum I
    #   linguam: por-Latn
    #   # eng-Latn 'Unknow translation' -> por-Latn ? = nil
    #   ---
    #   {% incognitum_phrasim_est %}
    #   <!--[de_linguam:[eng-Latn]]-->Unknow translation<!--[[eng-Latn]:de_linguam]-->
    #   {% endincognitum_phrasim_est %}
    #
    # @resultatum Exemplum I
    #   <span lang="en" class="incognitum-phrasim">Unknow translation</span>
    #
    # @exemplum Exemplum II
    #   linguam: eng-Latn
    #   # eng-Latn 'Unknow translation' -> por-Latn ? = nil
    #   ---
    #   {% incognitum_phrasim_est %}
    #   <!--[de_linguam:[eng-Latn]]-->Unknow translation<!--[[eng-Latn]:de_linguam]-->
    #   {% endincognitum_phrasim_est %}
    #
    # @resultatum Exemplum II
    #   Unknow translation
    #
    #
    # @exemplum Exemplum III
    #   linguam: arb-Arab
    #   htmldir: rtl
    #   # iso6391: ar
    #   # iso15924: Arab
    #   # eng-Latn 'Unknow translation' -> arb-Arab ? = nil
    #   ---
    #   {% incognitum_phrasim_est %}
    #   <!--[de_linguam:[eng-Latn]]-->Unknow translation<!--[[eng-Latn]:de_linguam]-->
    #   {% endincognitum_phrasim_est %}
    #
    # @resultatum Exemplum III
    #   <span lang="en" dir="ltr" class="incognitum-phrasim">Unknow translation</span>
    #
    # Trivia:
    # - 'incognitum'
    #   - https://en.wiktionary.org/wiki/incognitus#Latin
    # - 'phrasim'
    #   - https://en.wiktionary.org/wiki/incognitus#Latin
    # - 'est'
    #   - https://en.wiktionary.org/wiki/est#Latin
    class IncognitumPhrasimEstBlock < Liquid::Block
      def render(context)
        text = super

        return text unless text.include? '<!--[de_linguam:['

        @textum_signif = Translationem.significationem_incognitum_textum(text, context)

        @markup = Translationem.quod_html_markup_nunc(
          @textum_signif,
          Translationem.significationem_contextum(context)
        )

        @r = @markup ? "<span #{@markup}>#{@textum_signif['textum_purum']}</span>" : @textum_signif['textum_purum']

        # puts 'IncognitumPhrasimEstBlock> @markup ' + @markup.to_s + ' @r' +  @r
        @r
      end
    end
  end
end

# Liquid::Template.register_filter(HapiApi::Translationem)

Liquid::Template.register_tag(
  '_', Hapi::Translationem::DeL10n
)
Liquid::Template.register_tag(
  '__', Hapi::Translationem::DeL10n
)
Liquid::Template.register_tag(
  '___', Hapi::Translationem::DeL10n
)

# Liquid::Template.register_tag('gettext', HapiApi::TranslationemDeLatCodicem)
Liquid::Template.register_tag(
  'de_lat_codicem', Hapi::Translationem::DeLatCodicem
)
Liquid::Template.register_tag(
  'de_lat_codicem_in', Hapi::Translationem::DeLatCodicemIn
)

Liquid::Template.register_tag(
  'de_por_Latn', Hapi::Translationem::DePorLatn
)
Liquid::Template.register_tag(
  'de_por_Latn_in', Hapi::Translationem::DePorLatnIn
)

Liquid::Template.register_tag(
  'de_textum', Hapi::Translationem::DeTextum
)
Liquid::Template.register_tag(
  'de_phrasim', Hapi::Translationem::DeTextum
)

Liquid::Template.register_tag(
  'incognitum_phrasim_est', Hapi::Translationem::IncognitumPhrasimEstBlock
)
Liquid::Template.register_tag(
  'de_markdown', Hapi::Translationem::DeMarkdownBlock
)
Liquid::Template.register_tag(
  'de_non_html', Hapi::Translationem::DeNonHtmlBlock
)

# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
