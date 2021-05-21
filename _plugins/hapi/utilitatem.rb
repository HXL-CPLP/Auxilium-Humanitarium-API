# FILUM:           _lugins/hapi/utilitatem.rb
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

module HapiApi
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

      # puts item
      # puts @resultatum

      @resultatum
      # data = 'foo'
      # puts "Adler32 checksum: #{Zlib.adler32(data).to_s(16)}"
      # aa
    end

    # _[eng] Macro to 'expand' user written api data to new variables  [eng]_
    # _[por] Macro para 'expandir' o que usuário escreveu [por]_
    def expandendum_api_datum(apis)
      apis.map do |api|
        # puts api['uid']
        api['uid'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/#{api['lid']}/"
        api['dir'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/"
        api['trivium'] = digitum_premendum(api['x-default'])

        # puts api['uid']
        # api['openapi_filum'] = openapi_filum_de_api(api)
        # api = expandendum_api_datum_jekyll_page(api)
        expandendum_api_datum_jekyll_page(api)
      end

      apis
    end

    # _[eng] Macro to 'expand' user written api data to new variables [eng]_
    # _[por] Macro para 'expandir' o que usuário escreveu [por]_
    def expandendum_api_datum_jekyll_page(api)
      @hreflang = if xdefault_est(api)
                    'x-default'
                  else
                    linguam_to_html_lang(api['linguam'])
                  end
      puts @hreflang
      api['jekyll-page'] = {
        # 'locale' => Utilitatem.linguam_to_html_lang(api['linguam']),
        'linguam' => api['linguam'],
        'lang' => linguam_to_html_lang(api['linguam']),
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

    # _[eng] We use ISO 639-3, but HTML lang wants BCP-47 [eng]_
    # _[por] Usamos ISO 639-3, porém HTML lang deseja BCP-47 [por]_
    def linguam_to_html_lang(linguam)
      @referens = {
        'arb' => 'ar',
        'arb-Arab' => 'ar',
        'eng' => 'en',
        'eng-Latn' => 'en',
        'por' => 'pt',
        'por-Latn' => 'pt',
        'lat' => 'la',
        'lat-Latn' => 'la',
        'mul' => 'pt'
      }
      # puts linguam
      # puts @referens[linguam]
      @referens[linguam]
    end

    # _[eng] Clean control chars and white space from names [eng]_
    # _[por] Remove caracteres de controle e espaços em branco de nomes [por]_
    # Trivia:
    # - 'nomen', https://en.wiktionary.org/wiki/nomen#Latin
    # - 'pūrissimum', https://en.wiktionary.org/wiki/purissimus#Latin
    def nomen_purissimum(name)
      return name.to_s if name.is_a? Integer

      # TODO: _[eng] investigate usage of  /[[:word:]]/ [eng]_
      name.strip
          # Whitespace character ([:blank:], newline, carriage return, etc.)
          # replaced by -
          .gsub(/[[:space:]]/, '-')
          # /[[:cntrl:]]/ - Control character
          # remove any one present
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

    # _[eng] Jekyll Tags from an API item [eng]_
    # _[por] Tags Jekyll de item de API [por]_
    def tags_de_api(api)
      @tags = ['api']
      @tags.append("api-linguam-#{api['linguam']}") if api.key?('linguam')
      @tags.append("api-#{api['linguam']}") if api.key?('linguam')
      @tags.append("api-trivium-#{api['trivium']}") if api['trivium']

      @tags
    end

    # _[eng] Is this an x-default API? [eng]_
    # _[por] Esta é uma API x-default? [por]_
    def xdefault_est(api)
      api['linguam'] == 'mul'
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
