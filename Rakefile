# frozen_string_literal: true

# gem install rake
# https://ruby.github.io/rake/doc/rakefile_rdoc.html

# https://www.devdungeon.com/content/ruby-rake-tutorial
task default: %i[clean build install]

task :clean do
  puts 'Cleaning packages'
  # `rm *.deb`
end

task :build do
  puts 'Building mypackage-0.0.0'
  # `dpkg -b ./mypackage-0.0.0 ./mypackage-0.0.0.deb`
  puts 'Try `rake install` now.'
end

task :uninstall do
  puts 'Uninstalling mypackage'
  # `sudo apt-get remove -y mypackage`
end

task install: [:uninstall] do
  puts 'Installing mypackage-0.0.0'
  # `sudo apt-get install -y ./mypackage-0.0.0.deb`
end
