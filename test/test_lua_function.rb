require 'helper'

class TestCallLuaFromRuby < Test::Unit::TestCase
  context "a lua jit" do
    setup do
      @lua = Language::Lua.new()
    end

    should "return 5" do
      assert_equal 5.0, @lua.call("string.len", "hello")
      assert_equal 65.0, @lua.call("string.byte", "ABCDE")
      assert_equal 12.0, @lua.call("string.find", "Hello from Lua", "Lua")
    end
  end
end
