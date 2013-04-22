require 'helper'

class TestCallLuaFromRuby < Test::Unit::TestCase
  context "a lua jit" do
    setup do
      @lua = Language::Lua.new()
    end

    should "return 5.0" do
      assert_equal 5.0, @lua.call("string.len", "hello")
    end

    should "return 65.0" do
      assert_equal 65.0, @lua.call("string.byte", "ABCDE")
    end

    should "return 12.0" do
      assert_equal 12.0, @lua.call("string.find", "Hello from Lua", "Lua")
    end

    should "return 8.0" do
      assert_equal 8.0, @lua.var('string')["len"].call("ruby-lua")
    end
  end
end
