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

# require 'singleton'

module Hapi
  # _[lat] HSD, 'HicSuntDracones', Hic Sunt Dracones [lat]_
  # @see https://en.wikipedia.org/wiki/Here_be_dragons
  module HSD # rubocop:disable Metrics/ModuleLength
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
      # api = {}
      api = []
      categoriam = {}
      pittacium = {}
      # api

      HSD.pages?.each do |page|
        if page.instance_of?(Hapi::ApiPaginam)

          # [page.digitum_signaturum] = page
          api.append(page)
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
          categoriam[cat] = [] if categoriam[cat].nil?
          categoriam[cat].append(page)
        end
      end

      # api_xdefallo = api_xdefallo?(api)
      api_gid_xdefallo = api_gid_xdefallo?(api)
      globum = globum?(api)

      jekyll_data = HSD.data?

      jekyll_data['hapi'] = Hapi::Drops::HapiDrop.new(
        {
          'api' => api,
          # 'api_xdefallo' => api_xdefallo,
          'xapi' => api_gid_xdefallo,
          'globum' => globum,
          'categoriam' => categoriam,
          'scheman' => { 'TODO' => '_[eng] To be implemented also here [eng]_' },
          'xscheman' => { 'TODO' => '_[eng] To be implemented also here [eng]_' },
          'pittacium' => pittacium
        }
      )
      HSD.data!(jekyll_data)
    end

    def api?
      Jekyll.sites.last.data['api'] || [] # apil10n ?
    end

    def api_paginam?
      Jekyll.sites.last.data['hapi']['api'] || []
    end

    def api!(api)
      idx = Jekyll.sites.length - 1
      Jekyll.sites[idx].data['api'] = api
    end

    def api_gid_xdefallo?(api_collectionem = nil) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
      apis = api_collectionem || api?
      referens_gid = referens_gid?

      # puts 'oi oi '
      # puts referens_gid.empty?
      # puts apis.empty?
      return [] if referens_gid.empty? || apis.empty?

      # puts 'oi oi 2'

      # resultatum = {}
      resultatum = []

      referens_gid.each do |clavem_gid, valendum|
        # puts "api_gid_xdefallo [#{clavem_gid}] [#{valendum}]"
        # puts ''
        res = valendum
        res['collectionem_api'] = []
        apis.each do |api|
          res['collectionem_api'].append(api) if api.xdefallo_est && api.gid_est?(clavem_gid)
          # resultatum[clavem] = valendum
        end
        # resultatum.append(res)
        drop = Hapi::Drops::HapiGlobumDrop.new(res)
        resultatum.append(drop)
      end

      resultatum
    end

    # @deprecated remover
    def api_xdefallo?(api_collectionem = nil)
      apis = api_collectionem || api?
      # resultatum = {}
      resultatum = []

      apis&.each do |api|
        resultatum.append(api) if api.xdefallo_est
        # resultatum[clavem] = valendum
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

    # _[eng] Not implemented yet with this strategy [eng]_
    def schemam?
      []
    end

    # _[eng] Not implemented yet with this strategy [eng]_
    def xschemam?
      []
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

    # @deprecated
    # @see _data/referens.yml#gid
    def referens_gid? # rubocop:disable Metrics/AbcSize
      return [] if Jekyll.sites.last.data['l10n'].nil? || \
                   Jekyll.sites.last.data['l10n']['referensl10n'].nil? || \
                   Jekyll.sites.last.data['l10n']['referensl10n']['gid'].nil?

      Jekyll.sites.last.data['l10n']['referensl10n']['gid']
    end

    def globum?(api_collectionem = nil, _schemam_collectionem = nil) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      apis = api_collectionem || api?
      referens_gid = referens_gid?

      # puts 'oi oi '
      # puts referens_gid.empty?
      # puts apis.empty?
      return [] if referens_gid.empty? || apis.empty?

      # puts 'oi oi 2'

      # resultatum = {}
      resultatum = []

      referens_gid.each do |clavem_gid, valendum|
        # puts "api_gid_xdefallo [#{clavem_gid}] [#{valendum}]"
        res = valendum
        res['collectionem_api'] = []
        res['collectionem_xapi'] = []
        apis.each do |api|
          res['collectionem_api'].append(api) if api.gid_est?(clavem_gid)
          res['collectionem_xapi'].append(api) if api.xdefallo_est && api.gid_est?(clavem_gid)
          # resultatum[clavem] = valendum
        end
        # resultatum.append(res)
        drop = Hapi::Drops::HapiGlobumDrop.new(res)
        resultatum.append(drop)
      end

      resultatum
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
