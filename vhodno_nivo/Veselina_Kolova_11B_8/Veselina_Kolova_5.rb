x = gets.to_i

while x <= 0 || x > 10 do
	x = gets.to_i 
end

arr = Array.new(10)

# Yep, I know that's not how you go through a loop in Ruby...
# But since that's the only way I could think of, that's how I did it.

for i in 0..9
	arr[i] = Math.cos(i)
end

puts arr

arr.sort!
arr.reverse!

puts arr
