source 'https://rubygems.org'

# rubocop:disable RubocopIsRacistAndIcanProveIt/AsciiComments
#   @see https://github.com/rubocop/ruby-style-guide/issues/301
#   @see https://github.com/rubocop/ruby-style-guide/issues/137

# gem "github-pages", group: :jekyll_plugins
# gem "jekyll", "~> 3.9"

gem 'jekyll', '~> 4.2'

# TODO: _[eng-Latn] implement this fix to deal with GitHub actions 'rake aborted!
#                   LoadError: cannot load such file -- html-proofer
#                   https://github.com/gjtorikian/html-proofer/issues/326#issuecomment-753599594
#       [eng-Latn]_

group :jekyll_plugins do
  # @see https://github.com/toshimaru/jekyll-toc
  gem 'jekyll-toc'
  # gem 'jekyll-feed'
  gem 'jekyll-seo-tag'

  # https://github.com/envygeeks/jekyll-assets
  # gem 'jekyll-assets'
  # gem "jekyll-assets", git: "https://github.com/envygeeks/jekyll-assets"

  # Used only on Utilitatem.digitum_identicum()
  # https://github.com/johanns/sha3
  gem 'sha3'
  ## Notitia: [por] O jekyll-spaceship foi desabilitado no momento, 2021-05-16,
  ## Pois deixou o GitHub actions em torno de 3 minutos mais lento. E ainda
  ## não está sendo usado para justificar isso.
  # @see https://github.com/jeffreytse/jekyll-spaceship
  # gem 'jekyll-spaceship'
  # @see https://github.com/avillafiorita/jekyll-datapage_gen
  # gem 'jekyll-datapage-generator'
  gem 'kramdown-parser-gfm'
end

gem 'html-proofer'
gem 'rake'

## vscode-solargraph
# @see https://github.com/castwide/vscode-solargraph
#     gem install --user-install solargraph

# _[por] rubocop é tão racista que obriga re-habilitar
# AsciiComments [por]_
# rubocop:enable RubocopIsRacistAndIcanProveIt/AsciiComments
