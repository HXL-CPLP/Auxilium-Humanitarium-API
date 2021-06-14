# @ARCHĪVUM         _plugins/jekyll_hapi_hooks.rb
#
# @see https://jekyllrb.com/docs/plugins/hooks/
# @see https://github.com/jekyll/jekyll/blob/master/features/hooks.feature
# frozen_string_literal: true

# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137

require 'json'

# TODO: _[por] Implementar algum logging mais decente em vez de variaveis
#              globais, vide
#              https://www.mslinn.com/blog/2020/12/28/custom-logging-in-jekyll-plugins.html
#       [por]_

## https://womanonrails.com/ruby-iterators

Jekyll::Hooks.register :site, :after_reset do |site, _payload|
  # @see _plugins/hapi/hic_sunt_dracones.rb
  Hapi::HSD.initiale_after_reset(site)

end

# @see https://github.com/jekyll/jekyll/issues/6291
Jekyll::Hooks.register :site, :pre_render do |_site, _payload|
  # @see _plugins/hapi/hic_sunt_dracones.rb
  Hapi::HSD.initiale_pre_render

  # puts Hapi::HSD.api_xdefallo?
end

# Jekyll::Hooks.register :site, :post_read do |site|
#   puts 'site.tags'
#   puts site.tags
#   puts 'site.categories'
#   puts site.categories
# end

# Jekyll::Hooks.register :site, :pre_render do |site|
#   puts 'site.tags'
#   puts site.tags
#   puts 'site.categories'
#   puts site.categories
# end

# TODO: https://github.com/jekyll/jekyll/blob/master/features/hooks.feature

#### /deinsectum.json _________________________________________________________
# @see https://github.com/jekyll/jekyll/blob/master/features/hooks.feature

# Scenario: Work with the site files after they've been written to disk
Jekyll::Hooks.register :site, :post_write do |site| # rubocop:disable Metrics/BlockLength
  # puts Hapi::HSD.testum

  require 'fileutils'

  #### /data/ __________________________________________________________________

  if File.file?(File.join(site.dest, '/data/schemam.l10n.json')) && \
     (!File.file?(File.join(site.source, '/_data/l10n/schemam.l10n.json')) || !FileUtils.compare_file(
       File.join(site.dest, '/data/schemam.l10n.json'),
       File.join(site.source, '/_data/l10n/schemam.l10n.json')
     ))
    puts 'jekyll_hapi_hooks: cp _site/data/schemam.l10n.json _data/schemam.l10n.json'
    FileUtils.cp(
      File.join(site.dest, '/data/schemam.l10n.json'),
      File.join(site.source, '/_data/l10n/schemam.l10n.json')
    )
  end

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

  #### /assets _________________________________________________________________

  if !File.directory?(File.join(site.dest, '/assets/'))
    FileUtils.mkdir(File.join(site.dest, '/assets/'))
  end
  if !File.directory?(File.join(site.dest, '/assets/css'))
    FileUtils.mkdir(File.join(site.dest, '/assets/css'))
  end
  if !File.directory?(File.join(site.dest, '/assets/js'))
    FileUtils.mkdir(File.join(site.dest, '/assets/js'))
  end

  # if !File.file?(File.join(site.dest, '/assets/css/hapi.css'))
  if !File.file?(File.join(site.dest, '/assets/css/hapi.css')) || \
    (!FileUtils.compare_file(
      File.join(site.dest, '/assets/css/hapi.css'),
      File.join(site.source, '/_assets/css/hapi.css')
    ))
    puts 'jekyll_hapi_hooks: cp _assets/css/hapi.css _site/assets/css/hapi.css'
    FileUtils.cp(
      File.join(site.source, '/_assets/css/hapi.css'),
      File.join(site.dest, '/assets/css/hapi.css')
    )
  end

  # if !File.file?(File.join(site.dest, '/assets/css/hapi.css'))
  if !File.file?(File.join(site.dest, '/assets/js/hapi-api.mjs')) || \
    (!FileUtils.compare_file(
      File.join(site.dest, '/assets/js/hapi-api.mjs'),
      File.join(site.source, '/_assets/js/hapi-api.mjs')
    ))
    puts 'jekyll_hapi_hooks: cp _assets/js/hapi-api.mjs _site/assets/js/hapi-api.mjs'
    FileUtils.cp(
      File.join(site.source, '/_assets/js/hapi-api.mjs'),
      File.join(site.dest, '/assets/js/hapi-api.mjs')
    )
  end

  if !File.file?(File.join(site.dest, '/assets/js/hapi-globum.mjs')) || \
    (!FileUtils.compare_file(
      File.join(site.dest, '/assets/js/hapi-globum.mjs'),
      File.join(site.source, '/_assets/js/hapi-globum.mjs')
    ))
    puts 'jekyll_hapi_hooks: cp _assets/js/hapi-globum.mjs _site/assets/js/hapi-globum.mjs'
    FileUtils.cp(
      File.join(site.source, '/_assets/js/hapi-globum.mjs'),
      File.join(site.dest, '/assets/js/hapi-globum.mjs')
    )
  end

  # puts 'jekyll_hapi_hooks: cp _site/data/api.json _data/api.l10n.json'
  # File.write(File.join(site.dest, 'deinsectum.json'), @content)
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
