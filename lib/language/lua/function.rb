module Language
  class Lua
    class Function
      attr_accessor :lua, :fname

      def call(*args)
        @lua.call(fname, *args)
      end
    end
  end
end
