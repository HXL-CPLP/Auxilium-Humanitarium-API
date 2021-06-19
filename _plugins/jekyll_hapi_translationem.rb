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
                    :paginam_contextum, :referens,
                    :contextum_archivum_extensionem, :contextum_linguam,
                    :contextum_ego, :paratum_est, :referens_praeiudico,
                    :alternandum_linguam, :textum_solum_est,
                    :l10n_ego_linguam

      FONTEM_LINGUAM_EMOJI = ['👁️'].freeze
      OBJECTIVUM_LINGUAM_EMOJI = ['📝'].freeze
      VENANDUM_INSECTUM_EMOJI = ['🔎🐛🔍'].freeze
      SOS_EMOJI = ['🔎🆘🔍'].freeze
      SILENTIUM_EMOJI = ['🔇'].freeze

      # https://en.wiktionary.org/wiki/vacuus#Latin
      # VACUUM_TEXTUM = '∅'

      # 📳 https://emojipedia.org/vibration-mode/
      # 🔕 https://emojipedia.org/bell-with-slash/
      TEXTUM_SOLUM_EMOJI = ['🔎🔕🔍'].freeze

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

      def explanandum_resultatum # rubocop:disable Metrics/MethodLength,)
        contextum_linguam = Hapi::Datum::Linguam.new(
          { 'linguam' => @contextum_linguam, 'referens' => @referens }
        )
        l10n_ego_linguam = Hapi::Datum::Linguam.new(
          { 'linguam' => @l10n_ego_linguam, 'referens' => @referens }
        )
        fontem_linguam = Hapi::Datum::Linguam.new(
          { 'linguam' => @fontem_linguam, 'referens' => @referens }
        )
        objectivum_linguam = Hapi::Datum::Linguam.new(
          { 'linguam' => @objectivum_linguam, 'referens' => @referens }
        )

        alternandum_linguam = Hapi::Datum::Linguam.new(
          { 'linguam' => @alternandum_linguam, 'referens' => @referens }
        )

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @fontem_linguam [#{@fontem_linguam}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] resultatum [#{resultatum.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @tag_fontem [#{@tag_fontem.inspect}]"
        puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] [#{@contextum_linguam.inspect}]" if @sos_est
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @textum [#{@initiale_argumentum.inspect}]" if @sos_est
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] @fontem_linguam [#{@fontem_linguam.inspect}]"

        Hapi::Datum::L10nTag.new(
          {
            'crudum' => @tag_fontem,
            'contextum_archivum_extensionem' => @contextum_archivum_extensionem,
            'contextum_sos' => @contextum_sos,
            'contextum_linguam' => contextum_linguam, # TODO: replace contextum_linguam with l10n_ego_linguam
            'l10n_ego_linguam' => l10n_ego_linguam,
            'fontem_linguam' => fontem_linguam,
            'objectivum_linguam' => objectivum_linguam,
            'alternandum_linguam' => alternandum_linguam,
            'fontem_textum' => @textum,
            'venandum_insectum_est' => @venandum_insectum_est,
            'sos_est' => @sos_est,
            'textum_solum_est' => @textum_solum_est,
            'contextum_url' => @paginam_contextum['url'],
            'paratum_est' => if @fontem_linguam.nil? || @textum_solum_est == false
                               false
                             elsif @objectivum_linguam.nil?
                               @contextum_linguam == @fontem_linguam
                             else
                               @objectivum_linguam == @fontem_linguam
                             end
          }
        )
      end

      def investigationem_contextum(contextum) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize,Metrics/PerceivedComplexity
        # @objectivum_archivum_extensionem = File.extname(contextum['page']['url']) unless contextum['page']['url'].nil?
        @contextum_archivum_extensionem = File.extname(contextum['page']['url']) || contextum['ego_ext']
        @contextum_sos = contextum['page']['ego'] unless contextum['page']['ego'].nil?
        @referens = contextum['site']['data']['referens']
        @referens_praeiudico = contextum['site']['data']['referens']['praeiudico']
        @paginam_contextum = contextum['page']
        @textum_solum_est = quod_textum_solum_est?

        # TODO: convert contextum_linguam to @l10n_ego_linguam
        @contextum_linguam = if contextum['ego_linguam']
                               contextum['ego_linguam']
                             elsif contextum['page']['linguam']
                               contextum['page']['linguam']
                             end
        @l10n_ego_linguam = if contextum['l10n_ego_linguam']
                              contextum['l10n_ego_linguam']
                            elsif contextum['page']['linguam']
                              contextum['page']['linguam']
                            end
      end

      def quod_fontem_linguam_de_initiale_argumentum_et_textum
        return nil unless @initiale_argumentum.length > 1

        resultatum = quod_optionem_est?(FONTEM_LINGUAM_EMOJI)

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] resultatum [#{@initiale_argumentum.inspect}]"

        unless resultatum.nil? || resultatum[0].nil?
          # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] initiale_argumentum [#{@initiale_argumentum.inspect}]"
          # print "#{@initiale_argumentum}  item"
          @initiale_argumentum.delete_if do |item|
            item.include?(resultatum[1][0]) || item.include?(resultatum[1][1])
          end

          # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] resultatum [#{@resultatum.inspect}]"
          # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] initiale_argumentum [#{@initiale_argumentum.inspect}]"
          resultatum[0]
        end
      end

      def quod_objectivum_linguam_de_initiale_argumentum_et_textum
        return nil unless @initiale_argumentum.length > 1

        resultatum = quod_optionem_est?(OBJECTIVUM_LINGUAM_EMOJI)

        unless resultatum.nil? || resultatum[0].nil?
          # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] initiale_argumentum [#{@initiale_argumentum.inspect}]"
          @initiale_argumentum.delete_if do |item|
            item.include?(resultatum[1][0]) || item.include?(resultatum[1][1])
          end
          resultatum[0]
        end
      end

      # _[eng] remove 🐛 / 🆘 before detect what is real text[eng]_
      # _[eng] remove 🐛 / 🆘 antes de descobrir o que realmente é texto [eng]_
      def purgatum_optionem # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
        # return nil unless @initiale_argumentum.length > 1

        delvals = VENANDUM_INSECTUM_EMOJI + SOS_EMOJI + TEXTUM_SOLUM_EMOJI

        est = false
        est_items = []

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] [#{@initiale_argumentum.inspect}]"

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
      def quod_optionem_est?(emojis) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
        return nil unless @initiale_argumentum.length > 1

        valere = nil
        valere_arr = []
        # valere = []
        tags = []
        @initiale_argumentum.each do |arg|
          # emoje_est = false
          emojis.each do |emoji|
            next unless emoji.bytes == arg.bytes[0, emoji.bytes.length] && \
                        emoji.bytes == arg.bytes[- emoji.bytes.length, emoji.bytes.length]

            tags.append(arg)
            valere = arg.gsub(emoji, '')
            valere_arr.append(valere)
            break
          end
        end

        # puts 'puts final'

        [valere, tags]
      end

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

      def quod_textum_solum_est?
        TEXTUM_SOLUM_EMOJI.each do |item|
          # return true if @initiale_argumentum.include?(item)
          return true if @tag_fontem.include?(item)
          # if @initiale_argumentum.include?(item)
        end
        false
      end

      def quod_textum_de_initiale_argumentum_et_textum
        return @initiale_argumentum[0] if @initiale_argumentum.length == 1

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] [#{@initiale_argumentum.inspect}]"
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
  module Translationem # rubocop:disable Metrics/ModuleLength
    module_function

    # def datum_l10n(l10n_codice, context, linguam = nil)
    #   linguam = linguam.nil? ? context['page']['linguam'] : linguam
    #   # TODO: _[por] Implementar mensagem de erro se usuário errar linguam
    #   #              como usar 'linguam: por' em vez de 'linguam: por-Latn'
    #   #       [por]_
    #   hxlattrs = context['site']['data']['referens']['linguam'][linguam]['hxlattrs']
    #   context['site']['data']['L10nhxl'].each do |line|
    #     # if line['#item+code'] == l10n_codice
    #     next if line['#item+code'] != l10n_codice

    #     hxlattrs.each do |hxlattr|
    #       # puts hxlattr
    #       next unless line["#item+l10n#{hxlattr}"]

    #       # puts hxlattr
    #       # puts line["#item+l10n#{hxlattr}"]

    #       return line["#item+l10n#{hxlattr}"]
    #     end
    #   end

    #   nil
    # end

    # def datum_l10n_de_textum(textum, context, linguam_fontem, linguam_objectivum = nil)
    #   linguam_objectivum = linguam_objectivum.nil? ? context['page']['linguam'] : linguam_objectivum
    #   hxlattrs_fontem = context['site']['data']['referens']['linguam'][linguam_fontem]['hxlattrs']
    #   hxlattrs_objectivum = context['site']['data']['referens']['linguam'][linguam_objectivum]['hxlattrs']

    #   context['site']['data']['L10nhxl'].each do |line|
    #     # if line['#item+code'] == l10n_codice
    #     # puts "#item+l10n#{hxlattrs_fontem}"

    #     hxlattrs_fontem.each do |hxlattr_fon|
    #       next if line["#item+l10n#{hxlattr_fon}"] != textum

    #       hxlattrs_objectivum.each do |hxlattr_obj|
    #         # puts hxlattr
    #         next unless line["#item+l10n#{hxlattr_obj}"]

    #         # puts hxlattr
    #         # puts line["#item+l10n#{hxlattr}"]

    #         return line["#item+l10n#{hxlattr_obj}"]
    #       end
    #     end
    #   end

    #   nil
    # end

    # TODO: esta meio feio isso. Melhorar. Um problema é que cria
    #       tags <p> mesmo em elementos inline.
    # @deprecated
    def de_markdown(text)
      require 'kramdown'
      Kramdown::Document.new(text).to_html.to_s
    end

    # @deprecated use farmatum_alternandum_neo
    # TODO: _[por] Terminar a farmatum_alternandum, de modo que exiba
    #              informações também de depuração
    #       [por]_
    #
    # Trivia:
    # - 'fōrmātum', https://en.wiktionary.org/wiki/formatus#Latin
    # - 'alternandum', https://en.wiktionary.org/wiki/alternandus#Latin
    def farmatum_alternandum(
      contextum, trns_codicem, trns_resultatum,
      _trns_resultatum_linguam, textum_solum_est = false # rubocop:disable Style/OptionalBooleanParameter
    )
      html_est = contextum['page']['translationem_modum']
      linguam = contextum['page']['linguam']
      debug_est = contextum['page']['translationem_debug']
      # print 'oooi' if textum_solum_est
      if html_est == 'html' && !textum_solum_est
        return "<span data-l10n-c='#{trns_codicem}' data-l10n-linguam='#{linguam}'" \
               " class='incognitum-phrasim'>#{trns_resultatum}</span>"
      end
      return "_[#{linguam}]#{trns_resultatum}[#{linguam}]_" if debug_est

      trns_resultatum
    end

    # @deprecated. _[eng] Will be replaced by farmatum_praefectum_neo soon [eng]_
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

    # TODO: _[por] Terminar de portar funcionalidades de farmatum_alternandum [por]_
    # Trivia:
    # - 'fōrmātum', https://en.wiktionary.org/wiki/formatus#Latin
    # - 'alternandum', https://en.wiktionary.org/wiki/alternandus#Latin
    def farmatum_alternandum_neo(rem) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{rem.inspect}]" if rem.est_sos?
      # return rem.objectivum_textum + 'so texto' if rem.est_textum_solum_est?
      return rem.objectivum_textum if rem.est_textum_solum_est? && rem.objectivum_textum
      return rem.fontem_textum if rem.est_textum_solum_est?

      # attrs = {
      #   'lang' => rem.fontem_linguam.bcp47,
      #   'data-l10n-fontem-linguam' => rem.fontem_linguam.linguam,
      #   'data-l10n-objectivum-linguam' => rem.objectivum_linguam.linguam,
      # }

      if rem.est_html?
        attrs_str = Utilitatem.quod_html_attributum_markup_nunc?(
          {
            'lang' => rem.fontem_linguam.bcp47,
            'data-l10n-fontem-linguam' => rem.fontem_linguam.linguam,
            'data-l10n-objectivum-linguam' => rem.objectivum_linguam.linguam,
            'class' => 'incognitum-phrasim'
          }
        )

        return "<span #{attrs_str}>#{rem.fontem_textum}</span>"
      end

      # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{rem.inspect}]" if rem.est_sos?
      # _[eng] If not HTML, then likely to be JSON, XML or CSV. If this is
      #        an error, use 🔎🆘🔍 on the tag
      # _[eng]
      rem.objectivum_textum
    end

    # Trivia:
    # - 'fōrmātum', https://en.wiktionary.org/wiki/formatus#Latin
    # - 'praefectum', https://en.wiktionary.org/wiki/praefectus#Latin
    def farmatum_praefectum_neo(rem) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{rem.inspect}]" if rem.est_sos?
      # return rem.objectivum_textum + 'so texto' if rem.est_textum_solum_est?
      return rem.objectivum_textum if rem.est_textum_solum_est?

      # attrs = {
      #   'lang' => rem.fontem_linguam.bcp47,
      #   'data-l10n-fontem-linguam' => rem.fontem_linguam.linguam,
      #   'data-l10n-objectivum-linguam' => rem.objectivum_linguam.linguam,
      # }

      if rem.est_html?
        attrs_str = Utilitatem.quod_html_attributum_markup_nunc?(
          {
            'lang' => rem.fontem_linguam.bcp47,
            'data-l10n-fontem-linguam' => rem.fontem_linguam.linguam,
            'data-l10n-objectivum-linguam' => rem.objectivum_linguam.linguam
          }
        )

        return "<span #{attrs_str}>#{rem.fontem_textum}</span>"
      end

      puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{rem.inspect}]" if rem.est_sos?
      # _[eng] If not HTML, then likely to be JSON, XML or CSV. If this is
      #        an error, use 🔎🆘🔍 on the tag
      # _[eng]
      rem.objectivum_textum
    end

    # _[eng] The 'last stand' output format (if no translation availible) [eng]_
    # _[por] A formatação de 'ultima defesa' (caso não haja traduções) [por]_
    # Trivia:
    # - 'fōrmātum', https://en.wiktionary.org/wiki/formatus#Latin
    # - 'ultima mundi quo steterit', https://es.wikipedia.org/wiki/%C3%9Altima_defensa
    # - 'rem', https://en.wiktionary.org/wiki/res#Latin
    def farmatum_ultima_mundi_quo_steterit(rem)
      # puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{rem.inspect}]" if rem.est_sos? || rem.est_venandum_insectum?

      # @see https://stackoverflow.com/questions/18705373/ruby-equivalent-for-pythons-try
      # "try" block
      if rem.est_html?
        return "<span lang='#{rem.fontem_linguam.bcp47}' data-l10n-fontem-textum='#{rem.fontem_textum}' " \
               "data-l10n-fontem-linguam='#{rem.fontem_linguam.linguam}' " \
               "data-l10n-errorem='1' data-l10n-objectivum-linguam='#{rem.objectivum_linguam.linguam}'>" \
               "#{rem.fontem_textum}</span>"
      end
      rem.fontem_textum
    rescue StandardError => e
      puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} [#{e}] [#{rem.inspect}]"
    end

    # TODO: _[por] terminar de mover para _plugins/hapi/utilitatem.rb [por]_
    # @see https://iso639-3.sil.org/code_tables/639/data
    # @see https://www.wikidata.org/wiki/Property:P220
    def iso6393_de_linguam(linguam)
      return linguam unless linguam.length != 3

      @parts = linguam.split('-')

      return @parts[0] unless @parts[0].length != 3

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

    # TODO: _[por] terminar de mover para _plugins/hapi/utilitatem.rb [por]_
    #
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
    def praeiudico_htmldir_de_linguam(linguam, referens_praeiudico) # rubocop:disable Metrics/AbcSize
      return nil if linguam.length != 8

      @parts = linguam.split('-')

      return nil if @parts[0].nil? || @parts[0].length != 3

      # return nil if referens_praeiudico['iso3693'].nil?
      return nil if referens_praeiudico['iso3693'][@parts[0]].nil?
      return nil if referens_praeiudico['iso3693'][@parts[0]]['htmldir'].nil?

      referens_praeiudico['iso3693'][@parts[0]]['htmldir']
    end

    # TODO: _[por] terminar de mover para _plugins/hapi/utilitatem.rb [por]_
    #
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
    def significationem_incognitum_textum(textum, context) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
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
        'iso6391' => Utilitatem.iso6391_de_linguam(
          @linguam_fontem, context['site']['data']['referens']['praeiudico']
        ),
        'htmldir' => Utilitatem.praeiudico_htmldir_de_linguam(
          @linguam_fontem, context['site']['data']['referens']['praeiudico']
        )
      }
    end

    # _[lat-Lat] Trānslātiōnem memoriam, collēctiōnem [lat-Lat]_
    def translationem_memoriam_collectionem(contextum)
      # puts 'test'
      # puts contextum['site']['data']['tm'].keys
      contextum['site']['data']['tm']
    end

    # _[lat-Lat] Trānslātiōnem memoriam, rememorandum [lat-Lat]_
    def translationem_memoriam_rememorandum(contextum, codicem, linguam = nil)
      tm = translationem_memoriam_collectionem(contextum)
      # hxlattrs = HXL.hxlattrs_de_linguam(contextum, linguam)
      hxloptionem = HXL.optionem_de_linguam(contextum, linguam)
      tm.each do |archivum|
        next unless hxloptionem.quod_obiectum_optionem_existendum(tm[archivum[0]][0])

        tm[archivum[0]].each do |tm_item|
          val = hxloptionem.quod_obiectum_valendum(tm_item, codicem)

          return val unless val == false
        end
      end

      false
    end

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

    # # _[eng] The {% de_lat_codicem (...) %} implementation [eng]_
    # # _[por] A implementação de {% de_lat_codicem (...) %} [por]_
    # #
    # # @exemplum Primum exemplum
    # #   linguam: por-Latn
    # #   ---
    # #   {% de_lat_codicem licentiam_nomen %}
    # # @resultatum Primum exemplum
    # #   Licença
    # class DeLatCodicem < Liquid::Tag
    #   def initialize(tag_name, text, tokens)
    #     super

    #     @tokens = text.strip.split
    #     @textum = @tokens.shift
    #     @variant1 = @tokens.shift if @tokens
    #     # @datum = 123
    #   end

    #   def render(context)
    #     temp = Translationem.datum_temporarium(context)
    #     l10nval = Translationem.datum_l10n(@textum, context)

    #     return l10nval if l10nval

    #     return temp[@textum] if temp && temp[@textum]

    #     suffixes = Translationem.datum_temporarium_suffix(context)

    #     suffixes.each do |suffix|
    #       # puts "#{@text}#{suffix}"
    #       # puts temp["#{@text}#{suffix}"]
    #       # return Translationem.de(temp["#{@textum}#{suffix}"]) if temp && temp["#{@textum}#{suffix}"]
    #       return temp["#{@textum}#{suffix}"] if temp && temp["#{@textum}#{suffix}"]
    #     end

    #     "<!--[de_linguam:[lat-Latn]]-->#{@textum}<!--[[lat-Latn]:de_linguam]-->"
    #   end
    # end

    # _[eng] The L10n emoji entrypoint [eng]_
    # _[por] O ponto de entrada L10n emoji [por]_
    # @see https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/wiki
    class DeL10nEmoji < Liquid::Tag
      attr_accessor :tag_aux, :textum

      # https://en.wiktionary.org/wiki/vacuus#Latin
      VACUUM_TEXTUM = '∅'

      # @see https://www.rubydoc.info/gems/liquid/Liquid/ParseContext
      # @see https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers#arguments-and-initialization
      def initialize(tag_nomen, argumentum, initiale_processum)
        super

        @tag_aux = TranslationemNeo::AuxiliumTagProcessum.new(
          tag_nomen, argumentum, initiale_processum
        )
      end

      def render(context) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
        # temp = Translationem.datum_temporarium(context)
        # l10nval = Translationem.datum_l10n(@textum, context, @linguam_fontem)
        # l10nval = nil

        raise "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}]  Non @tag_aux!]" unless @tag_aux

        # if @tag_aux
        # puts context
        @tag_aux.investigationem_contextum(context)

        rem = @tag_aux.explanandum_resultatum
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] [#{@tag_aux.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] [#{rem.inspect}]"
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}] [#{rem.inspect}]"
        puts 'sos_est' if rem.sos_est
        puts 'est_sos?' if rem.est_sos?
        if rem.paratum_est
          # return Translationem.farmatum_praefectum(
          #   context, rem.fontem_textum, rem.fontem_textum
          # )
          return Translationem.farmatum_praefectum_neo(
            rem
          )
        end

        # l10n_contextum_init(context)

        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}]  oi #{rem.paratum_est}" if rem.venandum_insectum_est
        # puts "\n\n\t[🔎🐛 #{self.class.name}:#{__LINE__}]  oi #{rem.inspect}" if rem.venandum_insectum_est

        # Translationem.translationem_memoriam_collectionem(context)
        # puts Translationem.translationem_memoriam_rememorandum(context, @textum)
        l10nval = Translationem.translationem_memoriam_rememorandum(
          context, rem.fontem_textum, rem.objectivum_linguam.linguam
        )

        # puts 'sos_est' if rem.sos_est
        # puts 'est_sos?' if rem.est_sos?
        # puts l10nval.inspect if rem.est_sos?

        return '' if l10nval == VACUUM_TEXTUM

        if l10nval == false || l10nval.nil?
          Hapi::HSD.translationem_memoriam_rememorandum_non_perfectionem(rem)
        else
          rem.objectivum_textum = l10nval
          return Translationem.farmatum_praefectum_neo(
            rem
          )
        end

        # @TODO: _[eng-Latn] This entire section of language fallback should be
        #                    moved to the YAML configuration files eventually
        #        [eng-Latn]_

        l10nval_lat = Translationem.translationem_memoriam_rememorandum(
          context, rem.fontem_textum, 'lat-Latn'
        )

        return '' if l10nval_lat == VACUUM_TEXTUM

        if l10nval_lat != false && !l10nval_lat.nil?
          rem.alternandum_textum = l10nval_lat
          rem.alternandum_linguam = 'lat-Latn'
          # puts rem.inspect if rem.est_textum_solum_est?
          return Translationem.farmatum_alternandum(
            context, rem.fontem_textum, l10nval_lat,
            'lat-Latn', rem.est_textum_solum_est?
          )
          # return Translationem.farmatum_alternandum_neo(rem)
        end

        l10nval_por = Translationem.translationem_memoriam_rememorandum(
          context, rem.fontem_textum, 'por-Latn'
        )

        return '' if l10nval_por == VACUUM_TEXTUM

        if l10nval_por != false && !l10nval_por.nil?
          rem.alternandum_textum = l10nval_por
          rem.alternandum_linguam = 'por-Latn'
          # puts rem.inspect if rem.est_textum_solum_est?
          return Translationem.farmatum_alternandum(
            context, rem.fontem_textum, l10nval_por,
            'por-Latn', rem.est_textum_solum_est?
          )
          # return Translationem.farmatum_alternandum_neo(rem)
        end

        l10nval_eng = Translationem.translationem_memoriam_rememorandum(
          context, rem.fontem_textum, 'eng-Latn'
        )

        return '' if l10nval_eng == VACUUM_TEXTUM

        if l10nval_eng != false && !l10nval_eng.nil?
          rem.alternandum_textum = l10nval_eng
          rem.alternandum_linguam = 'eng-Latn'

          return Translationem.farmatum_alternandum(
            context, rem.fontem_textum, l10nval_eng,
            'eng-Latn', rem.est_textum_solum_est?
          )
        end

        l10nval_spa = Translationem.translationem_memoriam_rememorandum(
          context, rem.fontem_textum, 'spa-Latn'
        )

        return '' if l10nval_spa == VACUUM_TEXTUM

        if l10nval_spa != false && !l10nval_spa.nil?
          rem.alternandum_textum = l10nval_spa
          rem.alternandum_linguam = 'spa-Latn'
          return Translationem.farmatum_alternandum(
            context, rem.fontem_textum, l10nval_spa,
            'spa-Latn', rem.est_textum_solum_est?
          )
        end

        Hapi::HSD.translationem_memoriam_rememorandum_fallendum(rem)

        # item1 = Hapi::Datum::Linguam.new({'linguam' => 'por-Latn', 'referens' => context['site']['data']['referens']})
        # item2 = Hapi::Datum::Linguam.new({'linguam' => 'eng-Latn', 'referens' => context['site']['data']['referens']})

        # puts item1 == item2

        puts "\n\n\t[🔎🆘🔍 #{self.class.name}] #{__LINE__} Non-L10N :( [#{rem.inspect}]" if rem.sos_est

        Translationem.farmatum_ultima_mundi_quo_steterit(rem)
        # Translationem.farmatum_ultima_mundi_quo_steterit(
        #   context, rem.fontem_textum, rem.fontem_textum
        # )
      end

      # private

      # def l10n_contextum_init(contextum)
      #   @ego_sos = (contextum['ego'] && contextum['ego'] == '🆘')
      #   # if @ego_sos
      #   #   puts "!!! [DeL10nEmoji 🆘 de tag [#{@tag_nomen}], de textum [#{@textum}], \
      #   #     de site.page [#{contextum['site']['page']}] ]!!!"
      #   # end
      # end
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
  end
end

### Normal usage (html output, except as tag attribute)
## @exemplum:
#    {% _🗣️ L10N_ego_summarius 🗣️_ %}
Liquid::Template.register_tag(
  '_', Hapi::Translationem::DeL10nEmoji
)
Liquid::Template.register_tag(
  '_🗣️', Hapi::Translationem::DeL10nEmoji
)
Liquid::Template.register_tag(
  '🗣️_', Hapi::Translationem::DeL10nEmoji
)

# @deprecated l10n / n01l
Liquid::Template.register_tag(
  'l10n', Hapi::Translationem::DeL10nEmoji
)
# Liquid::Template.register_tag(
#   'n01l', Hapi::Translationem::DeL10nEmoji
# )

# _[eng]We still using de_markdown [eng]_
Liquid::Template.register_tag(
  'de_markdown', Hapi::Translationem::DeMarkdownBlock
)
# _[eng]We may still use de_non_html until the 🗣️ supports _[eng]_
Liquid::Template.register_tag(
  'de_non_html', Hapi::Translationem::DeNonHtmlBlock
)

# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
