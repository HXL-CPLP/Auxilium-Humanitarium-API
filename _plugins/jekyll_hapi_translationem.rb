# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# trānslātiōnem, https://en.wiktionary.org/wiki/translatio#Latin
# frozen_string_literal: true

# Trivia:
# - 'auxilium'
#   - https://en.wiktionary.org/wiki/auxilium#Latin
# - 'datum'
#   - https://en.wiktionary.org/wiki/auxilium
# - 'pāginam'
#   - https://en.wiktionary.org/wiki/pagina#Latin
# - ūtilitātem
#   - https://en.wiktionary.org/wiki/utilitas#Latin
# - 'expandendum'
#   - https://en.wiktionary.org/wiki/expando#Latin
# - 'archīvum'
#   - https://en.wiktionary.org/wiki/archivum#Latin

# _[lat] Hapi est programma de Auxilium Humanitarium API documentōrum. [lat]_
module Hapi
  # TODO: document TranslationemNeo
  module TranslationemNeo
    # TODO: document L10nTag
    # temp https://www.shopify.com/partners/shopify-cheat-sheet
    # see https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers
    # @see https://github.com/ticky/ruby-emoji-regex
    # @see https://github.com/janlelis/unicode-emoji
    # @see https://github.com/harttle/liquidjs
    class AuxiliumTagProcessum
      attr_accessor :tag_fontem, :tag_nomen, :initiale_argumentum, :fontem_linguam,
                    :objectivum_linguam, :ignorandum_hashtag,
                    :ignorandum_attributum, :textum, :error,
                    :initiale_processum, :venandum_insectum_est, :sos_est,
                    :paginam_contextum, :referens

      FONTEM_LINGUAM_EMOJI = ['👁️'].freeze
      OBJECTIVUM_LINGUAM_EMOJI = ['📝'].freeze
      VENANDUM_INSECTUM_EMOJI = ['🔎🐛🔍'].freeze
      SOS_EMOJI = ['🔎🆘🔍'].freeze

      # include Hapi.Datum
      # include Hapi.Datum

      def initialize(initiale_tag_nomen, initiale_argumentum, initiale_processum)
        @initiale_argumentum = initiale_argumentum.strip.split

        @tag_fontem = "{% #{initiale_tag_nomen}#{initiale_argumentum}%}"
        # argumentum_parts = initiale_argumentum.strip.split
        if initiale_tag_nomen.include?('🗣️')
          @tag_nomen = initiale_tag_nomen
        else
          @tag_nomen = "#{initiale_tag_nomen}#{@initiale_argumentum.shift}"
          # puts '    argumentum_parts1'
          # puts argumentum_parts
          @initiale_argumentum.tap(&:pop)
          # puts '    argumentum_parts2'
          # puts argumentum_parts
        end

        # @fontem_linguam = 'etc-Latn'

        @error = []
        @initiale_processum = initiale_processum

        @venandum_insectum_est = quod_venandum_insectum_est?
        @sos_est = quod_sos_est?
        @fontem_linguam = quod_fontem_linguam_de_initiale_argumentum_et_textum
        @objectivum_linguam = quod_objectivum_linguam_de_initiale_argumentum_et_textum

        purgatum_optionem # _[eng] required before get the text [eng]_
        @textum = quod_textum_de_initiale_argumentum_et_textum

        # @fontem_linguam = 'etc-Latn'
        # puts '    AuxiliumTagProcessum: initialize'
        # puts @tag_fontem
        # puts "                 [[[#{@fontem_linguam}]]]" if @venandum_insectum_est || @sos_est
        # puts @objectivum_linguam

        # ad_absurdum_l10n_tag
      end

      # @see https://en.wikipedia.org/wiki/List_of_Latin_phrases_(full)
      def ad_absurdum_l10n_tag
        # TODO: pegar linha do  @initiale_processum
        puts "Ad absurdum L10N tag: @tag_nomen [#{tag_nomen}], @initiale_argumentum " \
            "[#{@initiale_argumentum}], @initiale_argumentum [#{@initiale_argumentum}], " \
            "error [#{@error}], @initiale_processum.line_numbers " \
            "[#{@initiale_processum['line_numbers']}], @venandum_insectum_est [#{venandum_insectum_est}]"
      end

      def requisitum_explanandum_est?
        # return true

        true if @sos_est
        # true if @venandum_insectum_est && paginam_contextum.nil? || paginam_contextum['ego'] != '🔇'
        true if @venandum_insectum_est

        false
      end

      def explanandum_resultatum # rubocop:disable Metrics/MethodLength
        resultatum = Hapi::Datum::L10nTag.new(
          {
            # crudum => @tag_fontem,
            'crudum' => @tag_fontem,
            # tag_fontem => 'teste',
            # crudum => 'teste',
            'fontem_linguam' => @fontem_linguam,
            'objectivum_linguam' => @objectivum_linguam,
            'fontem_textum' => @textum,
            'venandum_insectum_est' => @venandum_insectum_est,
            'sos_est' => @sos_est
          }
        )

        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} @fontem_linguam [#{@fontem_linguam}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} resultatum [#{resultatum.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} @tag_fontem [#{@tag_fontem.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} @textum [#{@textum.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} @fontem_linguam [#{@fontem_linguam.inspect}]"

        resultatum
      end

      def quod_fontem_linguam_de_initiale_argumentum_et_textum
        return nil unless @initiale_argumentum.length > 1

        resultatum = quod_optionem_est?(FONTEM_LINGUAM_EMOJI)

        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} resultatum [#{@initiale_argumentum.inspect}]"

        unless resultatum.nil? || resultatum[0].nil?
          # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} initiale_argumentum [#{@initiale_argumentum.inspect}]"
          # print "#{@initiale_argumentum}  item"
          @initiale_argumentum.delete_if do |item|
            item.include?(resultatum[1][0]) || item.include?(resultatum[1][1])
          end

          # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} resultatum [#{@resultatum.inspect}]"
          # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} initiale_argumentum [#{@initiale_argumentum.inspect}]"
          resultatum[0]
        end
      end

      def quod_objectivum_linguam_de_initiale_argumentum_et_textum
        return nil unless @initiale_argumentum.length > 1

        resultatum = quod_optionem_est?(OBJECTIVUM_LINGUAM_EMOJI)

        unless resultatum.nil? || resultatum[0].nil?
          # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} initiale_argumentum [#{@initiale_argumentum.inspect}]"
          @initiale_argumentum.delete_if do |item|
            item.include?(resultatum[1][0]) || item.include?(resultatum[1][1])
          end
          resultatum[0]
        end
      end

      # _[eng] remove 🐛 / 🆘 before detect what is real text[eng]_
      # _[eng] remove 🐛 / 🆘 antes de descobrir o que realmente é texto [eng]_
      def purgatum_optionem
        # return nil unless @initiale_argumentum.length > 1

        delvals = VENANDUM_INSECTUM_EMOJI + SOS_EMOJI

        est = false
        est_items = []

        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} [#{@initiale_argumentum.inspect}]"

        @initiale_argumentum.each do |arg|
          delvals.each do |emoji|
            next unless emoji.bytes == arg.bytes[0, emoji.bytes.length] && \
                        emoji.bytes == arg.bytes[- emoji.bytes.length, emoji.bytes.length]

            est_items.append(arg)
            est = true
          end
        end
        # print 'ooooi222'
        if est_items.length.positive?
          # print 'ooooi222'
          @initiale_argumentum.delete_if do |arg_item|
            # print 'ooooi'
            est_items.include?(arg_item)
          end
        end

        est
      end

      # @see https://www.justinweiss.com/articles/3-steps-to-fix-encoding-problems-in-ruby/
      def quod_optionem_est?(emojis)
        return nil unless @initiale_argumentum.length > 1

        # valere = 'errorrrrrrrrrrrrrrrrvalere'
        valere = nil
        valere_arr = []
        # valere = []
        tags = []
        @initiale_argumentum.each do |arg|
          # puts "   > . >>>quod_optionem_est #{arg} #{arg.length} #{arg.strip.length}"
          # puts arg
          # puts arg.length
          # puts arg.strip
          # puts arg.strip.length
          # puts 'arg[0, 1]'
          # puts arg[0, 1]
          # puts 'arg[-1]'
          # puts arg[-1]
          # puts 'arg[0, 2]'
          # puts arg[0, 2]
          # puts 'arg[-2]'
          # puts arg[-2]
          # puts 'arg[0, 3]'
          # puts arg[0, 3]
          # puts 'arg[-3]'
          # puts arg[-3]
          # puts '  rrrrrrrrrrrrrrr quod_optionem_est' if @venandum_insectum_est || @sos_est
          # puts arg if @venandum_insectum_est || @sos_est
          # print arg[0, 1]
          # print arg[-1]

          # emoje_est = false
          emojis.each do |emoji|
            # puts "    > emoji emoji encoding #{emoji.encoding}"
            # puts "    > emoji arg encoding #{arg.encoding}"
            # puts "    > emoji.length #{emoji.length}"
            # puts "    > emoji.chars.length #{emoji.chars.length}"
            # puts "    > emoji.bytes.length #{emoji.bytes.length}"
            # puts "    > emoji #{emoji}"
            # puts "    > emoji.bytes #{emoji.bytes}"
            # puts "    > arg #{arg}"
            # puts "    >   arg.bytes #{arg.bytes}"
            # puts "    > arg.bytes[0, emoji.bytes.length] #{arg.bytes[0, emoji.bytes.length]}"
            # puts "    > arg.bytes[- emoji.bytes.length] #{arg.bytes[- emoji.bytes.length]}"
            # puts "    > arg.bytes[- emoji.bytes.length, emoji.bytes.length] #{arg.bytes[- emoji.bytes.length, emoji.bytes.length]}"
            # puts "    > arg [0, x] #{arg [0, emoji.length]}"
            # puts "    > arg [-x] #{arg[- emoji.length]}"
            # puts "    > arg [-3] #{arg[-3]}"

            # if emoji.bytes == arg.bytes[0, emoji.bytes.length]
            #   puts " 🆘🆘COMECA IGUAL _________________________________________________"
            # else
            #   puts " nooop comeca diferente"
            # end
            # if emoji.bytes == arg.bytes[- emoji.bytes.length, emoji.bytes.length]
            #   puts " 🆘🆘termina IGUAL _____________________________________________"
            # else
            #   puts " nooop termina diferente"
            # end

            next unless emoji.bytes == arg.bytes[0, emoji.bytes.length] && \
                        emoji.bytes == arg.bytes[- emoji.bytes.length, emoji.bytes.length]

            # puts "Ok"
            tags.append(arg)
            valere = arg.gsub(emoji, '')

            # print 'valere'
            # puts "[#{valere}]"
            # valere = arg.gsub(emoji.bytes, '')
            # valere = arg.bytes.gsub(emoji.bytes, '')
            valere_arr.append(valere)
            break
          end

          # puts 'yesss'

          # next unless emojis.include?(arg.first) && emojis.include?(arg.last)

          # puts ' >>> yes' if @venandum_insectum_est || @sos_est
          # puts emojis if @venandum_insectum_est || @sos_est
          # valere = arg[1, (arg.length - 2)]
          # # valere = arg
          # tags.append(arg)
          # puts [valere, tags] if @venandum_insectum_est || @sos_est
          # puts tags if @venandum_insectum_est || @sos_est
        end

        # puts 'puts final'

        [valere, tags]
        # [valere_arr, tags]

        # {
        #   valere: valere,
        #   tags: tags
        # }
      end

      # # TODO: L10nTag
      # class L10nTag
      #   attr_accessor :tag_fontem, :fontem_linguam, :objectivum_linguam,
      #                 :textum, :venandum_insectum_est, :sos_est
      # end

      # @see https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll
      # @see https://jekyllrb.com/docs/configuration/environments/
      def quod_situs_interretialis_testum_est?
        # puts ENV['JEKYLL_ENV']
        ENV['JEKYLL_ENV'] != 'production'
      end

      def quod_venandum_insectum_est?
        # puts '   ooooooooooooi   quod_venandum_insectum_est? '
        # puts VENANDUM_INSECTUM_EMOJI
        # puts '@initiale_argumentum'
        # puts @initiale_argumentum
        VENANDUM_INSECTUM_EMOJI.each do |item|
          # puts 'siiiiim'
          # puts item
          return true if @initiale_argumentum.include?(item)
          # if @initiale_argumentum.include?(item)
        end
        false
      end

      def quod_sos_est?
        SOS_EMOJI.each do |item|
          return true if @initiale_argumentum.include?(item)
          # if @initiale_argumentum.include?(item)
        end
        false
      end

      def quod_textum_de_initiale_argumentum_et_textum
        return @initiale_argumentum[0] if @initiale_argumentum.length == 1

        # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} [#{@initiale_argumentum.inspect}]"
        @initiale_argumentum.join(' ')
      end

      def hashtag_exemplum
        prefix = @hashtag.nil? ? [''] : @hashtag
        suffix = @attributum.nil? ? [''] : @attributum
        resultatum = []
        prefix.each do |pre|
          suffix.each do |suf|
            resultatum.append("#{pre}#{suf}")
          end
        end
        resultatum
      end
    end
  end

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

    # TODO: _[por] Terminar a farmatum_alternandum, de modo que exiba
    #              informações também de depuração
    #       [por]_
    #
    # Trivia:
    # - 'fōrmātum', https://en.wiktionary.org/wiki/formatus#Latin
    # - 'alternandum', https://en.wiktionary.org/wiki/alternandus#Latin
    def farmatum_alternandum(contextum, trns_codicem, trns_resultatum, _trns_resultatum_linguam)
      html_est = contextum['page']['translationem_modum']
      linguam = contextum['page']['linguam']
      debug_est = contextum['page']['translationem_debug']
      # print 'oooi'
      if html_est == 'html'
        return "<span data-l10n-c='#{trns_codicem}' data-l10n-linguam='#{linguam}'" \
               " class='incognitum-phrasim'>#{trns_resultatum}</span>"
      end
      return "_[#{linguam}]#{trns_resultatum}[#{linguam}]_" if debug_est

      trns_resultatum
    end

    # Trivia:
    # - 'fōrmātum', https://en.wiktionary.org/wiki/formatus#Latin
    # - 'praefectum', https://en.wiktionary.org/wiki/praefectus#Latin
    def farmatum_praefectum(contextum, trns_codicem, trns_resultatum)
      html_est = contextum['page']['translationem_modum']
      linguam = contextum['page']['linguam']
      debug_est = contextum['page']['translationem_debug']

      if html_est == 'html' && debug_est
        return "<span data-l10n-c='#{trns_codicem}' data-l10n-linguam='#{linguam}'>#{trns_resultatum}</span>"
      end
      return "<span data-l10n-c='#{trns_codicem}'>#{trns_resultatum}</span>" if html_est == 'html'
      return "_[#{linguam}]#{trns_resultatum}[#{linguam}]_" if debug_est

      trns_resultatum
    end

    # def hxlattrs_de_linguam(contextum, linguam = nil)
    #   linguam = linguam.nil? ? contextum['page']['linguam'] : linguam
    #   # TODO: _[por] Implementar mensagem de erro se usuário errar linguam
    #   #              como usar 'linguam: por' em vez de 'linguam: por-Latn'
    #   #       [por]_
    #   # hxlattrs = contextum['site']['data']['referens']['linguam'][linguam]['hxlattrs']
    #   #
    #   # hxlattrs

    #   contextum['site']['data']['referens']['linguam'][linguam]['hxlattrs']
    # end

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
      # puts contextum['site']['data']['tm'].keys
      contextum['site']['data']['tm']
    end

    def translationem_memoriam_rememorandum(contextum, codicem, linguam = nil)
      tm = translationem_memoriam_collectionem(contextum)
      # hxlattrs = HXL.hxlattrs_de_linguam(contextum, linguam)
      hxloptionem = HXL.optionem_de_linguam(contextum, linguam)
      # return 'n'
      # puts '    hxloptionem.hashtag_exemplum'
      # puts hxloptionem.hashtag_exemplum
      # return true
      # tm_collectionem.do |archivum|
      # tm.each do |archivum|
      tm.each do |archivum|
        # puts 'puts'
        # puts archivum[0]
        # puts tm[archivum]
        # puts archivum
        # puts tm[archivum[0]][0]
        # # puts tm[archivum[0]]
        # puts ''
        # puts ''
        # puts ''
        # puts tm[archivum]
        # puts tm[archivum].first
        # raise 'stop'
        # raise 'stop'
        next unless hxloptionem.quod_obiectum_optionem_existendum(tm[archivum[0]][0])

        # puts 'valido, continuando...'

        tm[archivum[0]].each do |tm_item|
          val = hxloptionem.quod_obiectum_valendum(tm_item, codicem)
          # puts 'val'
          # puts "#{codicem}, #{linguam}: #{val}" unless val == false
          return val unless val == false
        end

        # archivum.each do |tm_item|
        #   # puts hxlattr
        #   next unless HXL.testum(tm_item, hxloptionem)

        #   # puts hxlattr
        #   # puts line["#item+l10n#{hxlattr}"]

        #   return HXL.testum(tm_item, hxloptionem)
        # end
      end
      # puts 'hxlattrs'
      # puts hxlattrs
      # puts contextum['site']['data'].keys

      false
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

        if @textum.include?('🗣️') && @textum.length < 8
          tag_name = "#{tag_name}#{@textum}"
          @textum = @tokens.shift
        end

        @l10n_typum = L10n_typum_requisitum(tag_name)

        # puts '    DeL10n'
        # puts "   tag_name [#{tag_name}] @tokens [#{@tokens}] @textum [#{@textum}]"
        # puts  @textum

        # @iso6393 = Translationem.iso6393_de_linguam(@linguam_fontem)
        # @iso15924 = Translationem.iso15924_de_linguam(@linguam_fontem)
      end

      def render(context)
        # temp = Translationem.datum_temporarium(context)
        # l10nval = Translationem.datum_l10n(@textum, context, @linguam_fontem)
        # l10nval = nil

        # Translationem.translationem_memoriam_collectionem(context)
        # puts Translationem.translationem_memoriam_rememorandum(context, @textum)
        l10nval = Translationem.translationem_memoriam_rememorandum(context, @textum)
        # l10nval = 'tes'
        # raise l10nval if l10nval
        # return l10nval if l10nval != false
        return Translationem.farmatum_praefectum(context, @textum, l10nval) if l10nval != false

        l10nval_eng = Translationem.translationem_memoriam_rememorandum(context, @textum, 'eng-Latn')
        return Translationem.farmatum_alternandum(context, @textum, l10nval_eng, 'eng-Latn') if l10nval_eng != false

        l10nval_por = Translationem.translationem_memoriam_rememorandum(context, @textum, 'por-Latn')
        return Translationem.farmatum_alternandum(context, @textum, l10nval_por, 'por-Latn') if l10nval_por != false

        l10nval_spa = Translationem.translationem_memoriam_rememorandum(context, @textum, 'spa-Latn')
        return Translationem.farmatum_alternandum(context, @textum, l10nval_spa, 'spa-Latn') if l10nval_spa != false

        "[?#{@textum} #{@tokens}?]"
      end

      private

      # Trivia: requīsītum, https://en.wiktionary.org/wiki/requisitus#Latin
      def L10n_typum_requisitum(_tagname)
        # puts '_L10Ntypum'
        # {% _🗣️#️⃣ L10N_ego_summarius #️⃣🗣️_ %}
        resultatum = ('minimum' if @textum.include?('#️⃣'))

        # puts tagname
      end
    end

    # TODO: document DeL10nEmoji
    class DeL10nEmoji < Liquid::Tag
      attr_accessor :tag_aux, :textum

      # @see https://www.rubydoc.info/gems/liquid/Liquid/ParseContext
      # @see https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers#arguments-and-initialization
      def initialize(tag_nomen, argumentum, initiale_processum)
        super

        # puts 'tokens'
        # puts initiale_processum.inspect
        # print 'ooooooooooooooooooi'
        # if argumentum.include?('🗣️ ')


        if argumentum.include?('🗣️ 🔎🐛🔍')
          @tag_aux = TranslationemNeo::AuxiliumTagProcessum.new(tag_nomen, argumentum, initiale_processum)
        end

        # @tag_aux = TranslationemNeo::AuxiliumTagProcessum.new(tag_nomen, argumentum, initiale_processum)

        # puts tokens.locale
        # puts token['line_numbers']

        # l10n_contextum_de_tag()

        @tokens = argumentum.strip.split
        # @linguam_fontem = @tokens.shift
        @textum = @tokens.shift

        if @textum.include?('🗣️') && @textum.length < 8
          tag_nomen = "#{tag_nomen}#{@textum}"
          @textum = @tokens.shift
        end

        @l10n_in = L10n_typum_requisitum(tag_nomen)
        @tag_nomen = tag_nomen

        # puts '    DeL10n'
        # puts "   tag_nomen [#{tag_nomen}] @tokens [#{@tokens}] @textum [#{@textum}]"
        # puts  @textum

        # @iso6393 = Translationem.iso6393_de_linguam(@linguam_fontem)
        # @iso15924 = Translationem.iso15924_de_linguam(@linguam_fontem)
      end

      def render(context)
        # temp = Translationem.datum_temporarium(context)
        # l10nval = Translationem.datum_l10n(@textum, context, @linguam_fontem)
        # l10nval = nil

        if @tag_aux
          res = @tag_aux.explanandum_resultatum
          # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} [#{@tag_aux.inspect}]"
          # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} [#{res.inspect}]"
          # puts "\n\n\t[🔎🐛 #{self.class.name}] #{__LINE__} [#{res.inspect}]"

          L10n_contextum_init(context)

          # Translationem.translationem_memoriam_collectionem(context)
          # puts Translationem.translationem_memoriam_rememorandum(context, @textum)
          l10nval = Translationem.translationem_memoriam_rememorandum(context, res.fontem_textum)
          # l10nval = 'tes'
          # raise l10nval if l10nval
          # return l10nval if l10nval != false
          return Translationem.farmatum_praefectum(context, res.fontem_textum, l10nval) if l10nval != false

          l10nval_eng = Translationem.translationem_memoriam_rememorandum(context, res.fontem_textum, 'eng-Latn')
          if l10nval_eng != false
            return Translationem.farmatum_alternandum(context, res.fontem_textum, l10nval_eng,
                                                      'eng-Latn')
          end

          l10nval_por = Translationem.translationem_memoriam_rememorandum(context, res.fontem_textum, 'por-Latn')
          if l10nval_por != false
            return Translationem.farmatum_alternandum(context, res.fontem_textum, l10nval_por,
                                                      'por-Latn')
          end

          l10nval_spa = Translationem.translationem_memoriam_rememorandum(context, res.fontem_textum, 'spa-Latn')
          if l10nval_spa != false
            return Translationem.farmatum_alternandum(context, res.fontem_textum, l10nval_spa,
                                                      'spa-Latn')
          end

          puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} FALHOU [#{res.inspect}]"

          return "[?#{@textum} #{@tokens}?]"

          # puts "DeL10nEmoji @tag_aux tag_aux.tag_fontem [#{@tag_aux.tag_fontem}]"
          # puts 'oioioi'
          # @tag_aux.requisitum_explanandum_est?
          # puts 'ooooi111323423'
          # puts @tag_aux&.requisitum_explanandum_est?.inspect

          # puts ''
          # # puts '    >>>>>>>>>> explanandum_resultatum' if @tag_aux&.requisitum_explanandum_est?
          # # puts @tag_aux.explanandum_resultatum if @tag_aux&.requisitum_explanandum_est?
          # # puts @tag_aux.explanandum_resultatum
          # # if @tag_aux.explanandum_resultatum['fontem_linguam']
          # # if @tag_aux.explanandum_resultatum.fontem_linguam
          # if @tag_aux.explanandum_resultatum.fontem_linguam.nil?
          #   puts '  not fontem_linguam'
          #   #   return "[🚧fontem_linguam not implemented🚧] #{textum} [🚧fontem_linguam not implemented🚧]"
          # else
          #   puts 'oooookay'
          #   # puts @tag_aux.explanandum_resultatum
          #   # puts @tag_aux.explanandum_resultatum[':fontem_linguam']
          #   # puts @tag_aux.explanandum_resultatum.key(':fontem_linguam')
          #   # puts "keys #{@tag_aux.explanandum_resultatum.keys}"
          #   puts "keys #{@tag_aux.explanandum_resultatum}"
          #   # puts @tag_aux.explanandum_resultatum['fontem_linguam']
          #   # puts @tag_aux.explanandum_resultatum['tag_fontem']
          #   # puts @tag_aux.explanandum_resultatum.tag_fontem
          # end
        end

        # puts 'context[\'ego\']'
        # puts context['ego'] if context['ego']
        L10n_contextum_init(context)

        # Translationem.translationem_memoriam_collectionem(context)
        # puts Translationem.translationem_memoriam_rememorandum(context, @textum)
        l10nval = Translationem.translationem_memoriam_rememorandum(context, @textum)
        # l10nval = 'tes'
        # raise l10nval if l10nval
        # return l10nval if l10nval != false
        return Translationem.farmatum_praefectum(context, @textum, l10nval) if l10nval != false

        l10nval_eng = Translationem.translationem_memoriam_rememorandum(context, @textum, 'eng-Latn')
        return Translationem.farmatum_alternandum(context, @textum, l10nval_eng, 'eng-Latn') if l10nval_eng != false

        l10nval_por = Translationem.translationem_memoriam_rememorandum(context, @textum, 'por-Latn')
        return Translationem.farmatum_alternandum(context, @textum, l10nval_por, 'por-Latn') if l10nval_por != false

        l10nval_spa = Translationem.translationem_memoriam_rememorandum(context, @textum, 'spa-Latn')
        return Translationem.farmatum_alternandum(context, @textum, l10nval_spa, 'spa-Latn') if l10nval_spa != false

        "[?#{@textum} #{@tokens}?]"
      end

      private

      def l10n_contextum_de_tag(tag_tokens); end

      def L10n_contextum_init(contextum)
        @ego_sos = (contextum['ego'] && contextum['ego'] == '🆘')
        # if @ego_sos
        #   puts "!!! [DeL10nEmoji 🆘 de tag [#{@tag_nomen}], de textum [#{@textum}], \
        #     de site.page [#{contextum['site']['page']}] ]!!!"
        # end
      end

      # Trivia: requīsītum, https://en.wiktionary.org/wiki/requisitus#Latin
      def L10n_typum_requisitum(_tagname)
        # puts '_L10Ntypum'
        # {% _🗣️#️⃣ L10N_ego_summarius #️⃣🗣️_ %}
        resultatum = ('minimum' if @textum.include?('#️⃣'))

        # puts tagname
      end
    end

    # {% __🆘__ %}
    class DeL10nDebug < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super

        @tokens = text.strip.split
        # @linguam_fontem = @tokens.shift
        @textum = @tokens.shift

        if @textum.include?('🗣️') && @textum.length < 8
          tag_name = "#{tag_name}#{@textum}"
          @textum = @tokens.shift
        end

        # puts '   DeL10nDebug'
        # puts "   tag_name [#{tag_name}] @tokens [#{@tokens}] @textum [#{@textum}]"
        # puts  @textum

        # @iso6393 = Translationem.iso6393_de_linguam(@linguam_fontem)
        # @iso15924 = Translationem.iso15924_de_linguam(@linguam_fontem)
      end

      def render(context)
        # "[?#{@textum} #{@tokens}?]"
        # @see https://jekyllrb.com/docs/variables/#global-variables
        {
          page: {
            linguam: context['page']['linguam'],
            url: context['page']['url'],
            dir: context['page']['dir'],
            path: context['page']['path']
          },
          # layout: {
          #   ___: context['layout']
          # },
          site: {
            linguam: context['site']['linguam']
          },
          translationem: {
            errors: [
              '_[por]Funcionalidade ainda não implementada[por]_'
            ]
          }
        }
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

# {% __🆘__ %}
Liquid::Template.register_tag(
  '__', Hapi::Translationem::DeL10nDebug
)
# _ deprecated
Liquid::Template.register_tag(
  '_', Hapi::Translationem::DeL10nEmoji
)

# __ Ok, same as %{ _1 ...  1_ %}
# Liquid::Template.register_tag(
#   '_1', Hapi::Translationem::DeL10n
# )
# Liquid::Template.register_tag(
#   '1__', Hapi::Translationem::DeL10n
# )

### Normal usage (html output, except as tag attribute)
## @exemplum:
#    {% _🗣️ L10N_ego_summarius 🗣️_ %}
Liquid::Template.register_tag(
  '_🗣️', Hapi::Translationem::DeL10nEmoji
)
Liquid::Template.register_tag(
  '🗣️_', Hapi::Translationem::DeL10nEmoji
)

### HTML attribute output or JSON with no room for output messages
## @exemplum:
#    <a href="#" title="{% _🗣️#️⃣ L10N_ego_summarius #️⃣🗣️_ %}">Text</a>
Liquid::Template.register_tag(
  '_🗣️#️⃣', Hapi::Translationem::DeL10nEmoji
)
Liquid::Template.register_tag(
  '#️⃣🗣️_', Hapi::Translationem::DeL10nEmoji
)

### Debug
## @exemplum:
#    {% _🗣️🚫🐛 L10N_ego_summarius 🐛🚫🗣️_ %}
Liquid::Template.register_tag(
  '_🗣️🚫🐛', Hapi::Translationem::DeL10nEmoji
)
Liquid::Template.register_tag(
  '🐛🚫🗣️_', Hapi::Translationem::DeL10nEmoji
)

# 🐛
# Liquid::Template.register_tag(
#   '_🗣️_', Hapi::Translationem::DeL10n
# )
# Liquid::Template.register_tag(
#   '🗣️', Hapi::Translationem::DeL10n
# )
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
