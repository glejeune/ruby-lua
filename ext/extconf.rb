#!/usr/bin/ruby -w
# See the LICENSE file for copyright and distribution information

require "mkmf"
init_mkmf

$LIBPATH.push(RbConfig::CONFIG['libdir'])

RUBY_LUA_VERSION=open(File.join(File.dirname(__FILE__), "..", "VERSION")).read.chomp
open("version.h", 'w') { |f|
  f.write <<-EOF
#ifndef RUBY_LUA_VERSION
#define RUBY_LUA_VERSION "#{RUBY_LUA_VERSION}"
#endif
  EOF
}

def crash(str)
  printf(" extconf failure: %s\n", str)
  exit 1
end

lib = ""

if /^1.8/.match RUBY_VERSION
    $CFLAGS << " -DRUBY_1_8"
end

if dir_config( "lua50" ) != [nil, nil]
   inc, lib = dir_config( 'lua50' ) 
   $LDFLAGS << " -L#{lib} -llualib50 -llua50"
   $CFLAGS << " -I#{inc}"
elsif dir_config( "lua" ) != [nil, nil]
   inc, lib = dir_config( 'lua' ) 
   $LDFLAGS << " -L#{lib} -llualib -llua"
   $CFLAGS << " -I#{inc}"
elsif dir_config( "lua51" ) != [nil, nil]
   inc, lib = dir_config( 'lua51' ) 
   $LDFLAGS << " -L#{lib} -llua5.1"
   $CFLAGS << " -I#{inc}"
elsif dir_config( "lua52" ) != [nil, nil]
   inc, lib = dir_config( 'lua52' ) 
   $LDFLAGS << " -L#{lib} -llua5.2"
   $CFLAGS << " -I#{inc}"
elsif ex = find_executable( "lua-config" )
   $LDFLAGS << ' ' + `#{ex} --libs`.chomp
   $CFLAGS << ' ' + `#{ex} --include`.chomp
elsif ex = find_executable( "pkg-config" )
   $LDFLAGS << ' ' + `( #{ex} --libs lua5.2 || #{ex} --libs lua5.1 || #{ex} --libs lua ) 2>/dev/null`.chomp
   $CFLAGS << ' ' + `( #{ex} --cflags lua5.2 || #{ex} --cflags lua5.1 || #{ex} --cflags lua ) 2>/dev/null`.chomp
else
  crash(<<EOL)
need lua

        Install the library or try one of the following options to extconf.rb:

        --with-lua-lib=/path/to/liblua/lib
        --with-lua-include=/path/to/liblua/include
		or
        --with-lua50-lib=/path/to/liblua/lib
        --with-lua50-include=/path/to/liblua/include
		or
        --with-lua51-lib=/path/to/liblua/lib
        --with-lua51-include=/path/to/liblua/include
		or
        --with-lua52-lib=/path/to/liblua/lib
        --with-lua52-include=/path/to/liblua/include
EOL
end

if have_header( "lua.h" ) == false or have_header( "lauxlib.h" ) == false or have_header( "lualib.h" ) == false
  crash(<<EOL)
need liblua50 (headers not found)

        Install the library or try one of the following options to extconf.rb:

        --with-lua-lib=/path/to/liblua/lib
        --with-lua-include=/path/to/liblua/include
		or
        --with-lua50-lib=/path/to/liblua/lib
        --with-lua50-include=/path/to/liblua/include
EOL
end

puts "compile with : "
puts "  CFLAGS = #{$CFLAGS}"
puts "  LDFLAGS = #{$LDFLAGS}"
puts

$CFLAGS = '-g -Wall ' + $CFLAGS

#create_header()
create_makefile("language/lua")
