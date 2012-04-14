#!/usr/bin/ruby

require "../ext/lua"

def rb_function( str, num )
  puts "I'm a Ruby function. I was called by Lua!"
  puts "Lua gave me the String : #{str}"
  puts "and the Mumber : #{num}"
  puts "So I return the string : 'Thank you Lua!'"
  return 'Thank you Lua!'
end

puts "Hello... You are in Ruby..."

Language::Lua.new() { |lua| 
  lua.eval '
  	function lua_function( )
  	  print( "Yes! I\'m Lua.")
  	  
  	  print( "I give you a String and a Number")
  	  r = ruby( "rb_function", "string", 3 )
  	  
  	  tagada="glop"
  	  
  	  print( "Ruby said : " .. r )
  	  print( "- You welcome!" ) 
  	end
  '
  
  puts "Knok! Knok! Lua ?"
  lua.lua_function()
  puts lua.var('tagada')
}

puts "- Bye!"
