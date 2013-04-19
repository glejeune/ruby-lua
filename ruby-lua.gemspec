# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name     = "ruby-lua"
  s.description = "Call Lua from Ruby (and Ruby from Lua in Ruby)"
  s.summary  = "Call Lua from Ruby (and Ruby from Lua in Ruby)"

  s.version  = "0.3.0"
  s.platform = Gem::Platform::RUBY

  s.authors  = ["Gregoire Lejeune"]
  s.email    = "gregoire.lejeune@free.fr"
  s.homepage = "http://github.com/glejeune/ruby-lua"
  s.license  = "MIT"

  s.files      = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
  s.extra_rdoc_files = ["LICENSE.txt","README.rdoc"]
  s.extensions       = ["ext/extconf.rb"]
  s.require_paths    = ["lib"]

  s.add_development_dependency("shoulda")
  s.add_development_dependency("bundler")
  s.add_development_dependency("rdoc")
  s.add_development_dependency("rake")
end

