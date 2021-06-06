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

# @see https://github.com/jekyll/jekyll/issues/6291
Jekyll::Hooks.register :site, :pre_render do |site, _payload|
  # puts 'site.inspect'
  # puts site.inspect
  # # puts site.docs.inspect
  # # tags = {}
  # puts 'teste'

  # return nil

  categoriam = {}
  pittacium = {}

  site.pages.each do |post|
    # unless post['tags'].nil?
    #   post['tags'].each do |tag|
    #     pittacium[tag] = [] if pittacium[tag].nil?
    #     pittacium[tag].append(post)
    #   end
    # end
    break

    puts 'post.class'
    # puts post.class
    puts post.instance_of?(Hapi::ApiPaginam)

    if post.instance_of?(Hapi::ApiPaginam)
      puts 'todo post Hapi::ApiPaginam'
      puts ''
    end

    # post.dig(:slug)
    # post&['tags']
    # a = [[1, [2, 3]]]

    # a.dig(0, 1, 1)                    #=> 3

    # post&.dig(:tags) do |tag|
    # post.dig(:tags) do |tag|
    #   pittacium[tag] = [] if pittacium[tag].nil?
    #   pittacium[tag].append(post)
    # end
    # pittacium&.dig(:tags) do |tag|
    #   pittacium[tag] = [] if pittacium[tag].nil?
    #   pittacium[tag].append(post)
    # end
    # post&['tags']&.each do |tag|
    #   pittacium[tag] = [] if pittacium[tag].nil?
    #   pittacium[tag].append(post)
    # end
    # post['categories'].each do |cat|
    #   categoriam[tag] = [] if categoriam[cat].nil?
    #   categoriam[cat].append(post)
    # end

    # puts 'do something'
    # puts post.inspect
    # puts post['tags'].inspect
  end
  # site.posts.docs.each do |post|
  #   puts 'do something'
  # end
  # puts 'site.pages.inspect'
  # puts site.pages.inspect
  # puts 'site.posts.inspect'
  # puts site.posts.inspect
  # puts 'site.documents.inspect'
  # puts site.documents.inspect
  # site.posts.docs.each do |post|
  # site.posts.each do |post|
  #   puts 'post.inspect'
  #   puts post.inspect
  #   post.tags.each do |post_tag|
  #     puts post_tag
  #   end
  # end

  # puts 'site.tags.inspect'
  # puts site.tags.inspect
  # # site['tags'] = %w[um ois]
  # # site['categories'] = ['tres', 'quatro']
  # puts payload.keys
  # puts payload.content
  # puts payload.jekyll
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
