require 'mathn'

x = gets.to_i

while x < 0 || x > 10 do x = gets.to_i end

arr = Array.new(10)

z = 2

(0..x).each do
	if Prime.prime?(z) && z % 10 == x then
		puts z
		arr < z
	end
	z++
end

puts arr
