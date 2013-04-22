require 'helper'

class TestVars < Test::Unit::TestCase
  context "a lua jit" do
    setup do
      @lua = Language::Lua.new()
    end

    should "create a string variable" do
      @lua.var("str", "This is a string")
      assert_equal "This is a string", @lua.var("str")
    end

    should "create a number variable" do
      @lua.var("num", 123)
      assert_equal 123.0, @lua.var("num")
    end

    should "create a boolean variable" do
      @lua.var("yes", true)
      @lua.var("no", false)

      assert_equal true, @lua.var("yes")
      assert_equal false, @lua.var("no")
    end

    should "create a nil variable" do
      @lua.var("null", NIL)
      assert_equal NIL, @lua.var("null")
    end

    should "create a table" do
      @lua.var("table", ["string", 123, true, NIL])
      table = @lua.var("table")
      assert_equal 4, table.size()
      assert_equal "string", table[1.0]
      assert_equal 123.0, table[2.0]
      assert_equal true, table[3.0]
      assert_equal NIL, table[4.0]
    end

    should "create a hash" do
      @lua.var("hash", {"string" => 123})
      hash = @lua.var("hash")
      assert_equal 123.0, hash["string"]
    end
  end
end
