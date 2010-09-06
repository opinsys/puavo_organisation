Gem::Specification.new do |s|
  s.name = "puavo_organisation"
  s.description = "Organisation configuration plugin for Puavo applications"
  s.version = "0.0.1"
  s.author = "Jouni Korhonen"
  s.email = "puavo@opinsys.fi"
  s.homepage = "http://github.com/opinsys/puavo_organisation"
  s.platform = Gem::Platform::RUBY
  s.summary = "Organisation configuration plugin for Puavo applications"
  s.files = ["Rakefile", "init.rb", "README.rdoc", "lib", "lib/puavo_organisation.rb", "lib/puavo", "lib/puavo/organisation.rb", "lib/puavo_organisation", "lib/puavo_organisation/controllers", "lib/puavo_organisation/controllers/helpers.rb", "rails", "rails/init.rb"]
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.rdoc"]
end

