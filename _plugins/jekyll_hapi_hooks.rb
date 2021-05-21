# @see https://jekyllrb.com/docs/plugins/hooks/
# @see https://github.com/jekyll/jekyll/blob/master/features/hooks.feature
# frozen_string_literal: true

# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137

require 'json'

# rubocop:disable Style/GlobalVars
# TODO: _[por] Implementar algum logging mais decente em vez de variaveis
#              globais, vide
#              https://www.mslinn.com/blog/2020/12/28/custom-logging-in-jekyll-plugins.html
#       [por]_
$HAPI_DI = {
  'noticia' => [],
  'reload_numerum' => 0
}

## https://womanonrails.com/ruby-iterators

# TODO: https://github.com/jekyll/jekyll/blob/master/features/hooks.feature

#### /deinsectum.json _________________________________________________________
# @see https://github.com/jekyll/jekyll/blob/master/features/hooks.feature

# Scenario: Work with the site files after they've been written to disk
Jekyll::Hooks.register :site, :post_write do |site|
  $HAPI_DI['reload_numerum'] += 1

  @deinsectum = {
    'deinsectum' => $HAPI_DI,
    'data' => site.data
  }
  @content = JSON.pretty_generate(@deinsectum)
  puts 'jekyll_hapi_hooks: deinsectum.json'
  File.write(File.join(site.dest, 'deinsectum.json'), @content)
end

# TODO: _[por] Talvez considerar gerar versão CSV de arquivos JSON (inclusive)
#              os com itens aninhados. Vide
#              https://stackoverflow.com/questions/7845015/convert-json-to-csv-in-ruby
#       [por]_
# TODO: _[por] Yaml
#              https://github.com/ruby/psych
#       [por]_

# rubocop:enable Style/GlobalVars
# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
