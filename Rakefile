require 'rubygems'
require 'bundler/setup'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "metachannels-api-client"
    gem.summary = %Q{Gem to consume the metachannels.com api}
    gem.description = %Q{A gem to consume the metachannels-api.  See http://support.metachannels.com/forums/202518-metachannels-api }
    gem.email = "support@metachannels.com"
    gem.homepage = "http://github.com/channels/metachannels-api-client"
    gem.authors = ["Alex Soto"]
    gem.add_dependency 'wrest', '~> 1.4.7'
    #gem.add_development_dependency "thoughtbot-shoulda", ">= 0"

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "metachannels-api-client #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rspec/core/rake_task'

desc "Run all RSpec tests"
RSpec::Core::RakeTask.new(:spec)