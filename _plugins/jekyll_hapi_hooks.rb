# FILE:            _plugins/jekyll_hapi_hooks.rb
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
# $SITE = nil
# $PAGE = nil

## https://womanonrails.com/ruby-iterators

# Jekyll::Hooks.register :site, :pre_render do |site|
#   $SITE = site
# end

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

  require 'fileutils'

  # f_api_data = File.join(site.source, '/_data/api.l10n.json')
  # f_api_site = File.join(site.dest, '/data/api.l10n.json')
  # f_api_cache = 'todo'

  # if File.file?(f_api_data) && \
  #    (!File.file?(f_api_data) || !FileUtils.compare_file(
  #      f_api_data,
  #      f_api_data
  #    ))
  #   puts 'jekyll_hapi_hooks: cp _site/data/api.l10n.json _data/api.l10n.json'
  #   FileUtils.cp(
  #     f_api_site,
  #     f_api_data
  #   )
  # end

  if File.file?(File.join(site.dest, '/data/api.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/api.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/api.l10n.json'),
       File.join(site.source, '/_data/api.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/api.l10n.json _data/api.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/api.l10n.json'),
      File.join(site.source, '/_data/api.l10n.json')
    )
  end

  if File.file?(File.join(site.dest, '/data/navigationem.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/navigationem.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/navigationem.l10n.json'),
       File.join(site.source, '/_data/navigationem.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/navigationem.l10n.json _data/navigationem.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/navigationem.l10n.json'),
      File.join(site.source, '/_data/navigationem.l10n.json')
    )
  end

  if File.file?(File.join(site.dest, '/data/referens.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/referens.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/referens.l10n.json'),
       File.join(site.source, '/_data/referens.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/referens.l10n.json _data/referens.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/referens.l10n.json'),
      File.join(site.source, '/_data/referens.l10n.json')
    )
  end

  if File.file?(File.join(site.dest, '/data/schema.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/schema.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/schema.l10n.json'),
       File.join(site.source, '/_data/schema.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/schema.l10n.json _data/schema.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/schema.l10n.json'),
      File.join(site.source, '/_data/schema.l10n.json')
    )
  end

  puts site.data.keys.inspect

  # puts 'jekyll_hapi_hooks: cp _site/data/api.json _data/api.l10n.json'
  # File.write(File.join(site.dest, 'deinsectum.json'), @content)
end

# Jekyll::Hooks.register :site, :post_read do |site, item2, item3|
#   # site = doc.site
#   puts 'hook 1'
#   puts site.inspect
#   puts site.data.keys.inspect
#   puts site.pages.inspect
#   puts item2.inspect
#   puts item3.inspect

#   puts 'Jekyll.inspect'
#   puts Jekyll.inspect
# end

# Jekyll::Hooks.register :site, :pre_render do |site, payload, item3|
#   # Neste ponto o jekyll_hapi_api.rb ja foi acionado
#   puts ''
#   puts ''
#   puts ''
#   puts 'hook 2'
#   puts site.inspect
#   puts site.data.keys.inspect
#   # puts site.pages.inspect
#   puts payload.inspect
#   puts item3.inspect
# end

# # @see https://humanwhocodes.com/blog/2019/04/jekyll-hooks-output-markdown/
# Jekyll::Hooks.register :documents, :pre_render do |doc, payload|
#   # make some local variables for convenience
# site = doc.site
# liquid_options = site.config['liquid']

# # create a template object
# template = site.liquid_renderer.file(doc.path).parse(doc.content)

# # the render method expects this information
# info = {
#   registers: { site: site, page: payload['page'] },
#   strict_filters: liquid_options['strict_filters'],
#   strict_variables: liquid_options['strict_variables']
# }

# # render the content into a new property
# doc.data['rendered_content'] = template.render!(payload, info)
# end

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
