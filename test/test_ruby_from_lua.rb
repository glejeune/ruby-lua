require 'helper'

def my_ruby_function(str, num)
  "str = #{str}, num = #{num}"
end

class TestRubyFromLua < Test::Unit::TestCase
  context "a lua jit" do
    setup do
      @lua = Language::Lua.new()
      @lua.eval <<-LUA
        function call_ruby()
          return ruby("my_ruby_function", "string", 3)
        end
      LUA
    end

    should "return the result of my_ruby_function" do
      assert_equal "str = string, num = 3.0", @lua.call(true, "call_ruby")
    end
  end
end
