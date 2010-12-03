/**
 * Copyright (C) 2004 Gregoire Lejeune <gregoire.lejeune@free.fr>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
 */

/* Please see the LICENSE file for copyright and distribution information */

#ifndef __RUBY_LUA_H__
#define __RUBY_LUA_H__

#include <ruby.h>
#include <rubyio.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#define RUBY_LUA_VERSION  "0.2.0"
#define RUBY_LUA_VERNUM   020

typedef struct RbTlua {
  lua_State *L;
	void *ud;
} RbTlua;

#endif
