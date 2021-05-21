# frozen_string_literal: true

# https://github.com/steemit/devportal/commit/d75a13d08b28faa397d649c5a325e266161ea204
# https://github.com/steemit/devportal/issues/38
# https://github.com/Phrogz/NeatJSON
# https://gist.github.com/georgkreimer/537794
# https://stackoverflow.com/questions/86653/how-to-pretty-format-json-output-in-ruby-on-rails
module Jekyll
  #
  class HapiDeinsectum < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      puts context
      # site.data
      # 'TODO'
      "#{@text} #{Time.now} #{@text}"
    end
  end
end

Liquid::Template.register_tag('hapi_deinsectum', Jekyll::HapiDeinsectum)
