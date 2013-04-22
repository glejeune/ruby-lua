require 'rubygems'
require 'bundler'
require 'rake'
require 'rake/testtask'
require 'rubygems/package_task'
require 'rdoc/task'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end
task :test => :compile

task :default => :test

RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruby-lua #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :compile do
  chdir 'ext' do
    ruby 'extconf.rb'
    sh   'make'
  end
end

task :clean do
  chdir 'ext' do
    sh 'rm -f *.bundle *.dll *.so *.o *.obj Makefile config.h mkmf.log'
  end
end

Bundler::GemHelper.install_tasks
