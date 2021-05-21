# https://jekyllrb.com/docs/plugins/hooks/
# frozen_string_literal: true

## https://womanonrails.com/ruby-iterators

# TODO: https://github.com/jekyll/jekyll/blob/master/features/hooks.feature

# Jekyll::Hooks.register :site, :after_init do |site|
Jekyll::Hooks.register :site, :post_read do |site|
  # # code to call after Jekyll renders a page
  # print 'jekyll-hapi-hooks: hi!'
  # # print site.data.api
  # # print site.data.linguam
  # # puts site.data
  # # puts site.posts.docs
  # # puts site.collections
  # # puts site.pages
  # # puts site.data['api']

  # site.data['api'].map do |api|
  #   # Is possible to change title, description,
  #   # but locale may be overriden.

  #   # api["title"] = "teste teste " + api["title"]
  #   # api["description"] = "test desc"
  #   # api["x-default"] = api["x-default"] + "oioioioi"
  #   # if api["linguam"] == "eng"
  #   #     api["locale"] = "en"
  #   # end
  #   case api['linguam']
  #   when 'eng'
  #     api['locale'] = 'en'
  #   when 'por'
  #     api['locale'] = 'pt'
  #   when 'lat'
  #     api['locale'] = 'la'
  #   when 'mul'
  #     api['locale'] = 'pt'
  #   end
  # end

  # puts 'jekyll-hapi-hooks: bye!'
end

# Jekyll::Hooks.register :site, :after_init do |site|
Jekyll::Hooks.register :site, :post_render do |site|
  # # code to call after Jekyll renders a page
  puts 'jekyll-hapi-hooks: site post_render hi!'

  # site.pages.each do |page|
  #   puts page.docs
  # end

  puts site.source

  puts 'jekyll-hapi-hooks: site post_render bye!'
end

# Jekyll::Hooks.register :pages, :post_init do |page|
#   # code to call after Jekyll renders a page
#   puts page
# end

# # Jekyll::Hooks.register :site, :after_init do |site|
# Jekyll::Hooks.register :site, :post_read do |site|
#   # code to call after Jekyll renders a page
#   print 'jekyll-hapi-hooks: hi!'
#   # print site.data.api
#   # print site.data.linguam
#   # puts site.data
#   # puts site.posts.docs
#   # puts site.collections
#   # puts site.pages
#   # puts site.data['api']

#   site.pages.map do |page|
#     puts page.docs
#   end

#   puts 'jekyll-hapi-hooks: bye!'
# end
