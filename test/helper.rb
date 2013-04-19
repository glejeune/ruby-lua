require 'rubygems'
require 'bundler/setup'
require 'test/unit'
require 'shoulda'
require 'pathname'

cur = Pathname.new(File.expand_path("..", __FILE__))
lib = cur.join('..', 'lib')
ext = cur.join('..', 'ext')

unless ext.join("lua.so").exist?
 abort " ! Unable to run tests. Please run `rake build` first"
end

$LOAD_PATH.unshift(lib.to_s, ext.to_s, cur.to_s)
require 'lua'

class Test::Unit::TestCase
end
