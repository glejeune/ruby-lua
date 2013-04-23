require 'helper'

class TestLuaStack < Test::Unit::TestCase
  context "a lua jit" do
    setup do
      @lua = Language::Lua.new()
    end

    should "push and pop 3 values" do
      @lua.push "Hello"
      @lua.push 123
      @lua.push true
      assert_equal 3, @lua.stack_size

      assert_equal true, @lua.pop
      assert_equal 2, @lua.stack_size

      assert_equal 123.0, @lua.pop
      assert_equal 1, @lua.stack_size

      assert_equal "Hello", @lua.pop
      assert_equal 0, @lua.stack_size

      assert_equal NIL, @lua.pop
      assert_equal 0, @lua.stack_size
    end

    should "push 1 value and call lua method" do
      @lua.push Language::Lua::Function.new(@lua, "string.len") 
      @lua.push "Hello"
      assert_equal 5.0, @lua.call
      assert_equal 0, @lua.stack_size
    end
  end
end
