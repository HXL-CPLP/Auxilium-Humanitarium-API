# FILUM:           _plugins/hapi/utilitatem.rb
# DESCRIPTIONEM:   _[eng] Generic utils [eng]_
#                  _[por] Utilitários diversos [por]_
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# Trivia:
# - 'datum'
#   - https://en.wiktionary.org/wiki/datum#Latin
# - 'pāginam'
#   - https://en.wiktionary.org/wiki/pagina#Latin
# - ūtilitātem
#   - https://en.wiktionary.org/wiki/utilitas#Latin
# - 'expandendum'
#   - https://en.wiktionary.org/wiki/expando#Latin
# frozen_string_literal: true

# TODO: _[por] Alguma estratégia para redirecionar. Podemos usar como
#              referência https://github.com/jekyll/jekyll-redirect-from
#              porém provavelmente vamos ter que implementar em Ruby pra
#              permitir customização bem especifica para nossas necessidades
#       [por]_

module Hapi
  # _[eng] Generic utils [eng]_
  # _[por] Utilitários diversos [por]_
  module Utilitatem
    module_function

    # _[eng] Non-cryptographic finterprint (a checksum) [eng]_
    # _[por] Assinatura simples não criptográfica [por]_
    # Trivia:
    # - 'digitum', https://en.wiktionary.org/wiki/digitus#Latin
    # - 'premendum', https://en.wiktionary.org/wiki/premo#Latin
    def digitum_premendum(item)
      return if item.nil?

      require 'zlib'
      @resultatum = Zlib.adler32(item).to_s(16)

      @resultatum
    end

    # _[eng] Cryptographic finterprint (secure as year, 2021)[eng]_
    # _[por] Assinatura criptográfica (segura no ano de 2021) [por]_

    # @exemplum I
    #    Hapi::Utilitatem.digitum_identicum('testum')
    # @resultatum I
    #    f55b79e9eb848d587d7e9869b6582c0f9ab0504a8786cfa39854e583ec1bf71b92d47e02535a4e21b61166ae441431df
    # @exemplum II
    #    Hapi::Utilitatem.digitum_identicum(nil)
    # @resultatum II
    #    nil
    # @exemplum III
    #    Hapi::Utilitatem.digitum_identicum('')
    # @resultatum III
    #    0c63a75b845e4f7d01107d852e4c2485c51a50aaaa94fc61995e71bbee983a2ac3713831264adb47fb6bd1e058d5f004
    # Trivia:
    # - ruby SHA-3, https://github.com/johanns/sha3
    # - 'digitum', https://en.wiktionary.org/wiki/digitus#Latin
    # - 'identicum', https://en.wiktionary.org/wiki/identicus#Latin
    def digitum_identicum(item)
      return if item.nil?

      require 'sha3'

      @resultatum = SHA3::Digest::SHA384.digest(item)

      @resultatum.unpack1('H*')
    end

    # _[eng] Macro to 'expand' user written api data to new variables  [eng]_
    # _[por] Macro para 'expandir' o que usuário escreveu [por]_
    def expandendum_api_datum(apis, referens)
      apis.map do |api|
        # puts api['uid']
        api['uid'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/#{api['lid']}/"
        api['dir'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/"
        api['trivium'] = digitum_premendum(api['x-default'])

        # puts api['uid']
        # api['openapi_filum'] = openapi_filum_de_api(api)
        # api = expandendum_api_datum_jekyll_page(api)
        expandendum_api_datum_jekyll_page(api, referens)
      end

      apis
    end

    # _[eng] Macro to 'expand' user written api data to new variables [eng]_
    # _[por] Macro para 'expandir' o que usuário escreveu [por]_
    def expandendum_api_datum_jekyll_page(api, referens)
      @hreflang = if xdefault_est(api)
                    'x-default'
                  else
                    linguam_to_html_lang(api['linguam'], referens)
                  end
      # puts @hreflang
      api['jekyll-page'] = {
        # 'locale' => Utilitatem.linguam_to_html_lang(api['linguam']),
        'linguam' => api['linguam'],
        'lang' => linguam_to_html_lang(api['linguam'], referens),
        # @see https://www.w3.org/International/questions/qa-html-dir, dir="auto"
        'htmldir' => 'ltr', # FIXME: _[eng] Use _data/referens.yml for non-LTR [eng]-
        'hreflang' => @hreflang,
        'title' => api['namen'] || api['title'],
        'description' => api['description'] || api['descriptionem'],
        'tags' => tags_de_api(api),
        'openapi_filum2' => openapi_filum_de_api(api),
        'template' => 'api',
        'layout' => 'api',
        'trivium' => digitum_premendum(api['x-default'])
      }

      api
    end

    # @see https://iso639-3.sil.org/code_tables/639/data
    # @see https://www.wikidata.org/wiki/Property:P220
    def iso6391_de_linguam(linguam, referens_praeiudico) # rubocop:disable Metrics/AbcSize
      return nil if linguam.length != 8

      @parts = linguam.split('-')

      return nil if @parts[0].nil? || @parts[0].length != 3

      @iso6393 = @parts[0]

      # return nil if referens_praeiudico['iso3693'].nil?
      return nil if referens_praeiudico['iso3693'][@iso6393].nil?
      return nil if referens_praeiudico['iso3693'][@iso6393]['iso6391'].nil?

      referens_praeiudico['iso3693'][@iso6393]['iso6391']
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

      @parts = linguam.split('-')

      return nil if @parts[1].nil?

      return @parts[1] if @parts[1].length == 4

      nil
    end

    # _[eng] We use ISO 639-3, but HTML lang wants BCP-47 [eng]_
    # _[por] Usamos ISO 639-3, porém HTML lang deseja BCP-47 [por]_
    def linguam_to_html_lang(linguam, referens)
      if referens['linguam'][linguam].nil?
        puts "ERROR! linguam_to_html_lang referens #{linguam}!"
        return nil
      end

      referens['linguam'][linguam]['BCP47']
    end

    # # @see https://fettblog.eu/snippets/jekyll/liquid-in-frontmatter/
    # # @see https://rubydoc.info/gems/liquid
    # def quod_liquid_resultatum(textum)
    #   puts 'TODO'
    #   textum = 'Hi {{ tagname }}'
    #   @context = {
    #     'tagname' => 'value name'
    #   }

    #   Liquid::Template.parse(textum).render(@context)
    # end

    # _[eng] Clean control chars and white space from names [eng]_
    # _[por] Remove caracteres de controle e espaços em branco de nomes [por]_
    # Trivia:
    # - 'nomen', https://en.wiktionary.org/wiki/nomen#Latin
    # - 'pūrissimum', https://en.wiktionary.org/wiki/purissimus#Latin
    def nomen_purissimum(name)
      return name.to_s if name.is_a? Integer

      # TODO: _[eng] investigate usage of  /[[:word:]]/ [eng]_
      name.strip
          # _[eng] Whitespace character ([:blank:], newline, carriage return,
          #        etc.) replaced by -
          # [eng]_
          .gsub(/[[:space:]]/, '-')
          # _[eng] /[[:cntrl:]]/ - Control character remove any one present
          # [eng]_
          .gsub(/[[:cntrl:]]/, '')
    end

    # _[eng] Jekyll Tags from an API item [eng]_
    # _[por] Tags Jekyll de item de API [por]_
    def openapi_filum_de_api(api)
      if api['openapi_filum'].nil?
        @filum = "#{api['x-default'].gsub('/mul/', '/')}/#{api['linguam']}/openapi.yaml"
        @filum
      else
        api['openapi_filum']
      end
    end

    # _[eng] The attributes of HTML markup right now? [eng]_
    # _[lat] quod html attribūtum markup nunc? [lat]_
    # _[lat] Qual marcação HTML neste momento [lat]_
    def quod_html_attributum_markup_nunc?(attrs)
      markup = ''
      non_vacuum_attr = []
      attrs.each do |k, v|
        non_vacuum_attr.append("#{k}='#{v}'") if v
      end
      markup = non_vacuum_attr.join(' ') if non_vacuum_attr.length.positive?
      markup
    end

    # _[eng] Jekyll Tags from an API item [eng]_
    # _[por] Tags Jekyll de item de API [por]_
    def tags_de_api(api)
      @tags = ['api']
      @tags.append("api-linguam-#{api['linguam']}") if api.key?('linguam')
      @tags.append("api-#{api['linguam']}") if api.key?('linguam')
      @tags.append("api-trivium-#{api['trivium']}") if api['trivium']

      @tags
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
    def praeiudico_htmldir_de_linguam(linguam, referens_praeiudico) # rubocop:disable Metrics/AbcSize
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

    # _[eng] Is this an x-default API? [eng]_
    # _[por] Esta é uma API x-default? [por]_
    def xdefault_est(api)
      api['linguam'] == 'mul' || api['linguam'] == 'mul-Zyyy'
    end

    # _[eng] Return list of hreflang alternate of an API [eng]_
    # _[por] Retorna lista de 'hreflan alternate' de uma API [por]_
    def xalternate_api_totale(api, apis)
      @totale = []
      @apis_est = apis.nil? ? site.data['api'] : apis

      @apis_est.each do |api_ref|
        @totale.append(api_ref['x-default']) if api['x-default'] == api_ref['x-default']
      end

      @totale
    end

    # _[eng] Return list of hreflang alternate of an Jekyll Page [eng]_
    # _[por] Retorna lista de 'hreflan alternate' de uma Jekyll Page [por]_
    def xalternate_jekyll_page(_page)
      @totale = []
      @apis_est = apis.nil? ? site.data['api'] : apis

      @apis_est.each do |api_ref|
        @totale.append(api_ref['x-default']) if api['x-default'] == api_ref['x-default']
      end

      @totale
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
