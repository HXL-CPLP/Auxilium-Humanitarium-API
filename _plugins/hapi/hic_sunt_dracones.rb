# FILUM:           _plugins/hapi/hic_sunt_dracones.rb
# DESCRIPTIONEM:   _[lat] hic sunt dracones [lat]_
#
# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137
#
# Trivia:
# - 'hic sunt dracones'
#   - https://en.wikipedia.org/wiki/Here_be_dragons
# frozen_string_literal: true

require 'singleton'

module Hapi
  # _[lat] HSD, 'HicSuntDracones', Hic Sunt Dracones [lat]_
  # @see https://en.wikipedia.org/wiki/Here_be_dragons
  module HSD
    module_function

    # # _[eng] Global Anti-pattern of global variable without global variable [eng]_
    # class Site
    #   include Singleton

    #   def jekyll_site
    #     Jekyll.sites.last
    #   end

    #   def jekyll_data
    #     Jekyll.sites.last.data
    #   end
    # end

    # @example
    #   Jekyll::Hooks.register :site, :pre_render do |site, _payload|
    #     Hapi::HSD.initiale_pre_render
    #   end
    def initiale_pre_render # rubocop:disable Metrics/AbcSize, Metrics/MethodLength,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
      api = {}
      categoriam = {}
      pittacium = {}
      # api

      HSD.pages?.each do |page|
        if page.instance_of?(Hapi::ApiPaginam)

          api[page.digitum_signaturum] = page
        elsif page.instance_of?(Jekyll::Page)
          # puts 'Generic pages do not have any special feature'
        end

        unless page['tags'].nil? # rubocop:disable Style/SafeNavigation
          page['tags'].each do |tag|
            pittacium[tag] = [] if pittacium[tag].nil?
            pittacium[tag].append(page)
          end
        end
        next if page['categories'].nil?

        page['categories'].each do |cat|
          pittacium[cat] = [] if pittacium[cat].nil?
          pittacium[cat].append(page)
        end
      end

      api_xdefallo = api_xdefallo?(api)

      jekyll_data = HSD.data?

      jekyll_data['hapi'] = Hapi::Datum::HapiDrop.new(
        {
          'api' => api,
          'api_xdefallo' => api_xdefallo,
          'categoriam' => categoriam,
          'scheman' => { 'TODO' => '_[eng] To be implemented also here [eng]_' },
          'pittacium' => pittacium
        }
      )
      HSD.data!(jekyll_data)
    end

    def api?
      Jekyll.sites.last.data['api']
    end

    def api!(api)
      idx = Jekyll.sites.length - 1
      Jekyll.sites[idx].data['api'] = api
    end

    def api_xdefallo?(api_collectionem = nil)
      apis = api_collectionem || api?
      resultatum = {}

      apis&.each do |clavem, valendum|
        # puts 'teste'
        # puts clavem
        # puts valendum
        # puts valendum.xdefallo_est?
        # puts valendum.methods
        # resultatum[clavem] = valendum if apis[clavem].xdefallo_est?

        resultatum[clavem] = valendum if valendum.xdefallo_est?
      rescue StandardError => e
        puts "TODO: resolve this later #{e}"
        # puts "TODO: resolve this later #{exception} [#{clavem}]"
      end

      # TODO: order by UN, XZ, then others

      resultatum
    end

    def data?
      Jekyll.sites.last.data
    end

    def data!(data)
      idx = Jekyll.sites.length - 1
      Jekyll.sites[idx].data = data
    end

    def site?
      Jekyll.sites.last
    end

    def site!(site)
      idx Jekyll.sites.length - 1
      Jekyll.sites[idx] = site
    end

    def pages?
      Jekyll.sites.last.pages
    end

    def pages!(pages)
      idx = Jekyll.sites.length - 1
      Jekyll.sites[idx].pages = pages
    end

    def testum
      # puts 'okay'
      # puts 'Hapi.HSD.site?.inspect'
      # puts Hapi::HSD.site?.inspect

      # puts 'Hapi.HSD.data?.inspect'
      # puts Hapi::HSD.data?.inspect

      # var1 = HicSuntDracones::Site
      # puts var1.inspect
      # puts var1.methods(false).inspect
      # puts HicSuntDracones::Site.methods
      # puts var1.jekyll_site
      # puts 'Jekyll.sites.last.data.inspect'
      # puts Jekyll.sites.last.data.inspect
    end
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
