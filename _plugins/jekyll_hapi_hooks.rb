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
Jekyll::Hooks.register :site, :post_write do |site| # rubocop:disable Metrics/BlockLength
  # $HAPI_DI['reload_numerum'] += 1

  # @deinsectum = {
  #   'deinsectum' => $HAPI_DI,
  #   'data' => site.data
  # }
  # @content = JSON.pretty_generate(@deinsectum)
  # puts 'jekyll_hapi_hooks: deinsectum.json'
  # File.write(File.join(site.dest, 'deinsectum.json'), @content)

  require 'fileutils'

  # f_api_data = File.join(site.source, '/_data/l10n/api.l10n.json')
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
     (!File.file?(File.join(site.source, '/_data/l10n/api.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/api.l10n.json'),
       File.join(site.source, '/_data/l10n/api.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/api.l10n.json _data/api.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/api.l10n.json'),
      File.join(site.source, '/_data/l10n/api.l10n.json')
    )
  end

  if File.file?(File.join(site.dest, '/data/mappam-situm.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/l10n/mappam-situm.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/mappam-situm.l10n.json'),
       File.join(site.source, '/_data/l10n/mappam-situm.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/mappam-situm.l10n.json _data/mappam-situm.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/mappam-situm.l10n.json'),
      File.join(site.source, '/_data/l10n/mappam-situm.l10n.json')
    )
  end

  if File.file?(File.join(site.dest, '/data/navigationem.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/l10n/navigationem.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/navigationem.l10n.json'),
       File.join(site.source, '/_data/l10n/navigationem.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/navigationem.l10n.json _data/navigationem.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/navigationem.l10n.json'),
      File.join(site.source, '/_data/l10n/navigationem.l10n.json')
    )
  end

  if File.file?(File.join(site.dest, '/data/referens.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/l10n/referens.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/referens.l10n.json'),
       File.join(site.source, '/_data/l10n/referens.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/referens.l10n.json _data/referens.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/referens.l10n.json'),
      File.join(site.source, '/_data/l10n/referens.l10n.json')
    )
  end

  if File.file?(File.join(site.dest, '/data/schema.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/l10n/schema.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/schema.l10n.json'),
       File.join(site.source, '/_data/l10n/schema.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/schema.l10n.json _data/schema.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/schema.l10n.json'),
      File.join(site.source, '/_data/l10n/schema.l10n.json')
    )
  end

  # puts 'jekyll_hapi_hooks: cp _site/data/api.json _data/api.l10n.json'
  # File.write(File.join(site.dest, 'deinsectum.json'), @content)
end

# rubocop:enable Style/GlobalVars
# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
