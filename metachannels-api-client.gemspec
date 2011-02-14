# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{metachannels-api-client}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Soto"]
  s.date = %q{2011-02-10}
  s.description = %q{A gem to consume the metachannels-api.  See http://support.metachannels.com/forums/202518-metachannels-api }
  s.email = %q{support@metachannels.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".rvmrc",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/metachannels-api-client.rb",
     "metachannels-api-client.gemspec",
     "test/helper.rb"
  ]
  s.homepage = %q{http://github.com/channels/metachannels-api-client}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Gem to consume the metachannels.com api}
  s.test_files = [
    "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<wrest>, ["= 0.1.2"])
    else
      s.add_dependency(%q<wrest>, ["= 0.1.2"])
    end
  else
    s.add_dependency(%q<wrest>, ["= 0.1.2"])
  end
end

