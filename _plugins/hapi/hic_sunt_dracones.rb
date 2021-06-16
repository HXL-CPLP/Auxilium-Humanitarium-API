# @ARCHĪVUM         _plugins/hapi/hic_sunt_dracones.rb
# @DĒSCRĪPTIŌNEM   _[lat] hic sunt dracones [lat]_
#                  Art by Shanaka Dias
#                               __                  __
#                               ( _)                ( _)
#                             / / \\              / /\_\_
#                             / /   \\            / / | \ \
#                           / /     \\          / /  |\ \ \
#                           /  /   ,  \ ,       / /   /|  \ \
#                         /  /    |\_ /|      / /   / \   \_\
#                         /  /  |\/ _ '_| \   / /   /   \    \\
#                       |  /   |/  0 \0\    / |    |    \    \\
#                       |    |\|      \_\_ /  /    |     \    \\
#                       |  | |/    \.\ o\o)  /      \     |    \\
#                       \    |     /\\`v-v  /        |    |     \\
#                         | \/    /_| \\_|  /         |    | \    \\
#                         | |    /__/_ `-` /   _____  |    |  \    \\
#                         \|    [__]  \_/  |_________  \   |   \    ()
#                         /    [___] (    \         \  |\ |   |   //
#                         |    [___]                  |\| \|   /  |/
#                       /|    [____]                  \  |/\ / / ||
#                   snd (  \   [____ /     ) _\      \  \    \| | ||
#                       \  \  [_____|    / /     __/    \   / / //
#                       |   \ [_____/   / /        \    |   \/ //
#                       |   /  '----|   /=\____   _/    |   / //
#                     __ /  /        |  /   ___/  _/\    \  | ||
#                   (/-(/-\)       /   \  (/\/\)/  |    /  | /
#                                 (/\/\)           /   /   //
#                                         _________/   /    /
#                                       \____________/    (
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

require 'fileutils'
require 'yaml'
require 'json'

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

    def initiale_after_reset(site)
      schemam_fontem_path = File.join(site.source, '/_data/schemam.yml')
      hapi_referens_path = File.join(site.source, '/_data/referens.yml')
      schemam_expandendum_path = File.join(site.source, '/_data/expandendum/schemam.json')

      api_referens = YAML.load_file(hapi_referens_path)
      schemam_fontem = YAML.load_file(schemam_fontem_path)
      schemam_expandendum = Hapi::HSD.expandendum_schemam_archivum(schemam_fontem, api_referens['schemam'])
      # puts "initiale_after_reset #{site.source}"
      # puts "initiale_after_reset #{schemam_fontem_path} #{schemam_expandendum_path} #{api_referens['schemam']}"
      File.open(schemam_expandendum_path, 'w') do |f|
        f.write(JSON.pretty_generate(schemam_expandendum))
      end

      # File.write("public/temp.json",tempHash.to_json)

      # puts thing['schemam'].inspect
    end

    # @example
    #   Jekyll::Hooks.register :site, :pre_render do |site, _payload|
    #     Hapi::HSD.initiale_pre_render
    #   end
    def initiale_pre_render # rubocop:disable Metrics/AbcSize, Metrics/MethodLength,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
      # api = {}
      api = []
      schemam = []
      categoriam = {}
      pittacium = {}
      # api

      HSD.pages?.each do |page|
        if page.instance_of?(Hapi::ApiPaginam)

          # [page.digitum_signaturum] = page
          api.append(page)
        elsif page.instance_of?(Hapi::SchemamPaginam)
          schemam.append(page)
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
      xschemam = schemam_xdefallo?(schemam)
      globum = globum?(api, schemam)

      # puts globum[0]['collectionem_api']
      # puts globum[0]['collectionem_schemam']

      jekyll_data = HSD.data?

      jekyll_data['hapi'] = Hapi::Drops::HapiDrop.new(
        {
          'api' => api,
          # 'api_xdefallo' => api_xdefallo,
          'schemam' => schemam,
          'xapi' => api_gid_xdefallo,
          'xschemam' => xschemam, # Nota: acesse via globum ou entao interaga direto via schemam
          # 'xschemam' => { 'TODO' => '_[eng] To be implemented also here [eng]_' },
          'globum' => globum,
          'categoriam' => categoriam,
          'pittacium' => pittacium
        }
      )
      HSD.data!(jekyll_data)
    end

    def api?
      # Jekyll.sites.last.data['api'] || [] # apil10n ?
      Jekyll.sites.last.data['l10n']['apil10n'] || [] # apil10n ?
    end

    def api_paginam?
      Jekyll.sites.last.data['hapi']['api'] || []
    end

    def api!(api)
      idx = Jekyll.sites.length - 1
      Jekyll.sites[idx].data['api'] = api
    end

    def api_gid_xdefallo?(api_collectionem = nil) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength,Metrics/CyclomaticComplexity
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

    def l10n_simplex(codicem, linguam)
      # puts "TODO: l10n_simplex #{codicem} #{linguam}"

      codicem
    end

    def data!(data)
      idx = Jekyll.sites.length - 1
      Jekyll.sites[idx].data = data
    end

    # _[mul-Zyyy] _data/schemam.yml => _data/expandendum/schemam.json [mul-Zyyy]_
    # _[lat-Latn] Expandendum schēmam archīvum [lat-Latn]_
    def expandendum_schemam_archivum(schemam_collectionem, referens_schemam)
      resultatum = []
      schemam_collectionem.each do |item|
        if item['farmulam'].nil?
          resultatum.append(item)
        else
          items = Hapi::HSD.expandendum_schemam_de_farmulam(item['farmulam'], referens_schemam)
          resultatum.concat(items) unless items.empty?
        end
      end

      resultatum
    end

    # _[lat-Latn] Expandendum schēmam de fōrmulam [lat-Latn]_
    def expandendum_schemam_de_farmulam(schemam_farmulam, referens_schemam = {}) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      resultatum = []
      ref = referens_schemam.dig('defallo', 'farmulam')

      raise "[#{self.class.name}:#{__LINE__}] _data/referens.yml schemam.defallo.farmulam?" unless ref

      # raise "[#{self.class.name}:#{__LINE__}] _data/referens.yml schemam.defallo?" unless ref['']

      # puts ''

      meta = ref.deep_merge(schemam_farmulam)
      paginam_linguam = ref.dig('commendandum', 'paginam_linguam')
      paginam_linguam_experimentum = ref.dig('commendandum', 'paginam_linguam_experimentum')

      unless paginam_linguam
        raise "[#{self.class.name}:#{__LINE__}] _data/referens.yml + _data/schemam.yml: paginam_linguam?"
      end

      paginam_linguam.each do |linguam|
        # puts "TODO #{linguam}"
        resultatum.append(
          Hapi::HSD.convertendum_obiectum_linguam(meta['structuram'], "📝#{linguam}📝")
        )
      end

      if paginam_linguam_experimentum # rubocop:disable  Style/SafeNavigation
        paginam_linguam_experimentum.each do |linguam|
          # puts "TODO #{linguam}"
          rem = Hapi::HSD.convertendum_obiectum_linguam(meta['structuram'], "📝#{linguam}📝")
          rem['experimentum_est'] = true
          resultatum.append(rem)
        end
      end

      resultatum
    end

    # _[eng] Not implemented yet with this strategy [eng]_
    def schemam?
      Jekyll.sites.last.data['l10n']['schemaml10n'] || []
    end

    def schemam_paginam?
      Jekyll.sites.last.data['hapi']['schemam'] || []
    end

    def schemam_xdefallo?(schemam_collectionem = nil) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize,Metrics/CyclomaticComplexity
      # apis = schemam_collectionem
      schemam_collectionem ||= schemam?
      referens_gid = referens_gid?

      # puts 'oi oi '
      # puts referens_gid.empty?
      # puts apis.empty?
      return [] if referens_gid.empty? || schemam_collectionem.empty?

      # puts 'oi oi 2'

      # resultatum = {}
      resultatum = []

      referens_gid.each do |clavem_gid, valendum|
        # puts "api_gid_xdefallo [#{clavem_gid}] [#{valendum}]"
        # puts ''
        res = valendum
        res['collectionem_schemam'] = []
        schemam_collectionem.each do |schema|
          res['collectionem_schemam'].append(schema) if schema.xdefallo_est && schema.gid_est?(clavem_gid)
          # resultatum[clavem] = valendum
        end
        # resultatum.append(res)
        drop = Hapi::Drops::HapiGlobumDrop.new(res)
        resultatum.append(drop)
      end

      resultatum
    end

    # _[eng] Not implemented yet with this strategy [eng]_
    def xschemam?
      # NOTE: _[eng] the 'schemam_xdefallo?' is not using this method,
      #              neither 'globum?'
      #       [eng]_

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

    # _[lat-Latn] Convertendum obiectum linguam [lat-Latn]_
    def convertendum_obiectum_linguam(
      obiectum, objectivum_linguam = '📝lat-Latn📝', fontem_linguam = '📝und-Zyyy📝'
    )
      textum = JSON.generate(obiectum)
      textum_l10n = textum.gsub(fontem_linguam, objectivum_linguam)

      JSON.parse(textum_l10n)
    end

    # @deprecated
    # @see _data/referens.yml#gid
    def referens_gid? # rubocop:disable Metrics/AbcSize
      return [] if Jekyll.sites.last.data['l10n'].nil? || \
                   Jekyll.sites.last.data['l10n']['referensl10n'].nil? || \
                   Jekyll.sites.last.data['l10n']['referensl10n']['gid'].nil?

      Jekyll.sites.last.data['l10n']['referensl10n']['gid']
    end

    def globum?(api_collectionem = nil, schemam_collectionem = nil) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
      apis = api_collectionem || api?
      schemam_collectionem ||= schemam?
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
        res['collectionem_schemam'] = []
        res['collectionem_xschemam'] = []

        apis.each do |api|
          # api_drop = Hapi::Drops::HapiXdefalloApiDrop.new(res)
          res['collectionem_api'].append(api) if api.gid_est?(clavem_gid)
          # if api.gid_est?(clavem_gid)
          #   res['collectionem_api'].append(Hapi::Drops::HapiApiDrop.new(api))
          # end
          if !!api.xdefallo_est && api.gid_est?(clavem_gid)
            res['collectionem_xapi'].append(Hapi::Drops::HapiXdefalloApiDrop.new(api))
          end

          # res['collectionem_xapi'].append(api) if api.xdefallo_est && api.gid_est?(clavem_gid)
          # # resultatum[clavem] = valendum
        end

        schemam_collectionem.each do |schemam|
          # api_drop = Hapi::Drops::HapiXdefalloApiDrop.new(res)
          res['collectionem_schemam'].append(schemam) if schemam.gid_est?(clavem_gid)
          # if api.gid_est?(clavem_gid)
          #   res['collectionem_api'].append(Hapi::Drops::HapiApiDrop.new(api))
          # end

          # TODO: considerar implementar collectionem_xschemam
          if !!schemam.xdefallo_est && schemam.gid_est?(clavem_gid)
            # puts " #{schemam.nomen}"
            res['collectionem_xschemam'].append(Hapi::Drops::HapiXschemamDrop.new(schemam))
          end

          # res['collectionem_xapi'].append(api) if api.xdefallo_est && api.gid_est?(clavem_gid)
          # # resultatum[clavem] = valendum
        end

        # resultatum.append(res)
        drop = Hapi::Drops::HapiGlobumDrop.new(res)
        resultatum.append(drop)
      end

      resultatum
    end
  end
end

# @see https://stackoverflow.com/questions/9381553/ruby-merge-nested-hash#30225093
class ::Hash
  def deep_merge(second)
    merger = proc { |_, v1, v2|
      if v1.is_a?(Hash) && v2.is_a?(Hash)
        v1.merge(v2,
                 &merger)
      elsif v1.is_a?(Array) && v2.is_a?(Array)
        v1 | v2
      elsif [:undefined,
             nil, :nil].include?(v2)
        v1
      else
        v2
      end
    }
    merge(second.to_h, &merger)
  end
end

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
