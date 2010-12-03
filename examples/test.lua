-- defines a factorial function
function fact (n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end

-- define a stupid function
function hello( )
  return "world"
end

-- define a string variable
str = "blah blah blah"

-- define a number variable
num = 123

fact( 3 )
