require 'helper'

class TestCallLuaFromRuby < Test::Unit::TestCase
  context "a lua jit" do
    setup do
      @lua = Language::Lua.new()
      @lua.eval <<-LUA
      function one()
        return 1
      end

      function two()
        return 2, 3
      end

      function data(x)
        return x
      end
      LUA
    end

    should "return 1.0" do
      assert_equal 1.0, @lua.call(true, "one")
    end

    should "return 2.0" do
      assert_equal 2.0, @lua.call(true, "two")
    end

    should "return the given value" do
      assert_equal "hello", @lua.call(true, "data", "hello")
    end
  end
end
