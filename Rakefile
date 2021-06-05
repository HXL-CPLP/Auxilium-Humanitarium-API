# frozen_string_literal: true

# gem install rake
# https://ruby.github.io/rake/doc/rakefile_rdoc.html

# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137

# rake
task default: %i[download_hxl_datum]

# rake completum
task completum: %i[download_hxl_datum openapi_exportandum]

# @see https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit#gid=1181688279
task :download_hxl_datum do
  puts 'download_hxl_datum'
  puts 'Sincroliza dados HXL de _data/ do Google Planilhas' if l('pt')
  puts 'Syncronize HXL data from _data/ from Google Planilhas' if l('en')
  sh '_systema/programma/download-hxl-datum.sh'
end

task :openapi_exportandum do
  puts 'download_hxl_datum'
  puts 'openapi-generator-cli: gera arquivos baseado nos OpenAPI' if l('pt')
  puts 'openapi-generator-cli: generate files base on OpenAPI' if l('en')
  sh '_systema/programma/openapi-exportandum.sh'
end

# @see https://github.com/gjtorikian/html-proofer#using-with-jekyll
require 'html-proofer'

task :test do
  sh 'bundle exec jekyll build'
  options = {
    assume_extension: true,
    # If true, does not run the external link checker, which can take a lot of time.
    disable_external: true,
    # If true, ignores the href="#".
    allow_hash_href: true,
    # Enables HTML validation errors from Nokogumbo
    check_html: true,
    # An array of Strings or RegExps containing file paths that are safe to ignore.
    # Note; the graphql-doc generate malformated HTML, so we put exception here.
    # TODO: discover what regex html-proofer use. Copy all files is bizarre.
    file_ignore: [
      './_site/schema/iso/iso639-3/eng/graphql-doc/comment.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/i_id.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/i_status.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/id.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/m_id.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/part1.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/part2b.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/part2t.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/ref_name.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/scope.doc.html',
      './_site/schema/iso/iso639-3/eng/graphql-doc/type.doc.html'
    ]
  }
  HTMLProofer.check_directory('./_site', options).run
end

# _[por] Messages on user language [por]_
# _[por] Mensagem no idioma do usuário [por]_
# @exemplum
#   ENV['LANG'] contains 'pt_BR.UTF-8'
#   ---
#   l('pt')
# @resultatum
#   true
def l(iso6391, fallback: false)
  ENV['LANG']&.start_with?(iso6391) || fallback
end

# @see https://stackoverflow.com/questions/33582197/how-do-i-build-a-jekyll-site-from-rake-task-without-using-the-command-line

# # https://www.devdungeon.com/content/ruby-rake-tutorial
# task default: %i[clean build install]
#
# task :clean do
#   puts 'Cleaning packages'
#   # `rm *.deb`
# end

# task :build do
#   puts 'Building mypackage-0.0.0'
#   # `dpkg -b ./mypackage-0.0.0 ./mypackage-0.0.0.deb`
#   puts 'Try `rake install` now.'
# end

# task :uninstall do
#   puts 'Uninstalling mypackage'
#   # `sudo apt-get remove -y mypackage`
# end

# task install: [:uninstall] do
#   puts 'Installing mypackage-0.0.0'
#   # `sudo apt-get install -y ./mypackage-0.0.0.deb`
# end

# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
