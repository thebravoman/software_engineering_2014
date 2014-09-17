x = gets.to_i
y = gets.to_i

while x > y do
	x = gets.to_i
	y = gets.to_i
end

s = 0

for i in x..y
	if i % 17 == 0 then
		s += i
	end
end

puts s
