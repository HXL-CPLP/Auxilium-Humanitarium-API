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

    # _[eng] To do: document [eng]_
    # _[por] Por ser feito: documentar [por]_
    def sanitize_filename_i18n(name)
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

    # _[eng] Macro to 'expand' user written api data to new variables  [eng]_
    # _[por] Macro para 'expandir' o que usuário escreveu [por]_
    def expandendum_api_datum(apis)
      apis.map do |api|
        api['uid'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/#{api['lid']}/"
        api['dir'] = "/#{api['linguam']}/#{api['typum']}/#{api['gid']}/"
        # api = expandendum_api_datum_jekyll_page(api)
        expandendum_api_datum_jekyll_page(api)
      end

      apis
    end

    # _[eng] Macro to 'expand' user written api data to new variables [eng]_
    # _[por] Macro para 'expandir' o que usuário escreveu [por]_
    def expandendum_api_datum_jekyll_page(api)
      api['jekyll-page'] = {
        # 'locale' => Utilitatem.linguam_to_html_lang(api['linguam']),
        'linguam' => api['linguam'],
        'lang' => Utilitatem.linguam_to_html_lang(api['linguam']),
        'title' => api['namen'] || api['title'],
        'description' => api['description'] || api['descriptionem'],
        'tags' => tags_de_api(api),
        'template' => 'api',
        'layout' => 'api'
      }

      api
    end

    # _[eng] Jekyll Tags from an API item [eng]_
    # _[por] Tags Jekyll de item de API [por]_
    def tags_de_api(api)
      @tags = ['api']
      @tags.append("api-linguam-#{api['linguam']}") if api.key?('linguam')
      @tags.append("api-#{api['linguam']}") if api.key?('linguam')

      # if api.key?('linguam')
      #   @tags.append('api-' + api['linguam'])

      @tags
    end

    # _[eng] We use ISO 639-3, but HTML lang wants BCP-47 [eng]_
    # _[por] Usamos ISO 639-3, porém HTML lang deseja BCP-47 [por]_
    def linguam_to_html_lang(linguam)
      @referens = {
        'eng' => 'en',
        'por' => 'pt',
        'lat' => 'la',
        'mul' => 'pt'
      }
      @referens[linguam]
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
