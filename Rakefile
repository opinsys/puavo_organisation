require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the puavo_organisation plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the puavo_organisation plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'PuavoOrganisation'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    root_files = FileList["README.rdoc", "COPYING", "init.rb"]
    s.name = "puavo_organisation"
    s.summary = "Organisation configuration plugin for Puavo applications"
    s.email = "puavo@opinsys.fi"
    s.homepage = "http://github.com/opinsys/puavo_organisation"
    s.description = "Organisation configuration plugin for Puavo applications"
    s.authors = "Jouni Korhonen"
    s.files =  root_files + FileList["{rails,lib}/**/*"]
    s.extra_rdoc_files = root_files
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler"
end
