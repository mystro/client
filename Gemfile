source 'https://rubygems.org'

# Specify your gem's dependencies in mystro-client.gemspec
gemspec

if ENV["MYSTRO_DEV"]
  gem "mystro-common", :path => "../common"
else
  gem "mystro-common"
end
gem "awesome_print"

gem "mongo"
gem "bson_ext"

gem "chef", "~> 10.20.0"
