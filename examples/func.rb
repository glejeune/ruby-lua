#!/usr/bin/ruby

require "../lua"

def my_function( str, num )
  puts "In my_function !!!"
  return "str = #{str} / num = #{num}"
end

lua = Language::Lua.new()

lua.eval <<LUA
    function one( )
      return 1
    end

	function two( )
	  return 2, 3 
	end

	function data( x )
	  return x
	end

	function callRuby( )
	  r = ruby( "my_function", "string", 3 )
	  print( "r = " .. r ) 
	end
LUA

p lua.call( true, "one" );
  
p lua.call( true, "two" );

p lua.call( true, "data", "hello" ) 

lua.callRuby
