x = gets.to_i

while x <= 0 || x > 10 do
	x = gets.to_i 
end

arr = Array.new(10)

fib, f, s, i = 0, 0, 1, 0

# No idea what the problem is... 
until i == 9 do
	fib = f + s
	f = s	
	s = fib
	 
	if fib % x == 0 then
		arr.push(fib)
	end
	i++
end

puts arr
