require 'prime'

def random_prime_number 
	while(1) do
		random = rand(100)
		if random.prime?
			return random
		end
	end
end
p = random_prime_number  
q = random_prime_number 
n = p*q
fn = (p-1)*(q-1)

for e in 2..fn-1 
	if e.gcd(fn) == 1
		break
	end
end
puts "Public key: #{e}"

d = 100
while (1) do
	if ((d * e) %fn == 1) 
		break
	end
	d += 1 
end
puts "Private key: #{d}"


crypting_text = "May the odds be ever in my favor!!!"

puts "Text for crypting: #{crypting_text}"
decrypting = Array.new
decrypted = ""

crypting_text.each_char do |char|
	 crypt = (char.ord**e)%n
	 decrypting << crypt
end

decrypting.each do |char|
	decrypt =  (char ** d %n).chr
	decrypted += decrypt
end

puts "Decrypted text:    #{decrypted}"




