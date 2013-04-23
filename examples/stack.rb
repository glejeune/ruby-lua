#!/usr/bin/ruby

$:.unshift("../lib")
require "../ext/lua"

lua = Language::Lua.new()

lua.push "Hello"
lua.push 123
lua.push true

lua.stack_dump

3.times do 
  p lua.pop
end

lua.stack_dump

lua.push Language::Lua::Function.new(@lua, "string.len")
lua.push "Hello"
lua.stack_dump
p lua.call
lua.stack_dump

