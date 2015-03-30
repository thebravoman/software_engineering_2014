prime_numbers = [2, 3, 5, 11, 13, 17, 19, 23, 29, 31, 39, 41, 43, 47].shuffle!
crypted = Array.new
decrypted = ""

p = prime_numbers[0]
q = prime_numbers[1]
n = p*q

fn = (p-1)*(q-1)

for e in 2..fn-1 
	if e.gcd(fn) == 1
		break
	end
end
puts "Public key: #{e}"

d = 1000
while(1) do
	if  (d * e) % fn  == 1
		break
	end
	d += 1
end
puts "Private key: #{d}"


str = "You wake up? FLAWLESS!!!"

str.each_char do |char|
	 cry = (char.ord ** e) % n
	 crypted << cry
end


crypted.each do |char|
	res =  (char ** d % n).chr
	decrypted += res
end

p decrypted
