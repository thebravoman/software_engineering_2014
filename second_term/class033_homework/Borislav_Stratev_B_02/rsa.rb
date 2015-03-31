require 'prime.rb'

def generate_keys p, q
	generated = Hash.new
	e = d = 0
	n = p*q
	g = (p - 1)*(q - 1)
	while true
		e += 1
		if Prime.prime?(e) && g.gcd(e) == 1 then break end
	end
	while true
		d += 1
		if (d*e) % g == 1 then break end
	end
	puts "public key: #{e}"
	puts "private key: #{d}"
	generated = {"public_key" => e, "private_key" => d, "n" => n}
end

def encrypt message, public_key, n
	encrypted_message = Array.new
	message.each_byte do |symbol|
		result = symbol ** public_key % n 
		encrypted_message.push(result)
	end
	puts "encrypted message: #{encrypted_message}"
	return encrypted_message
end

def decrypt crypted_message, private_key, n
	decrypted_message = String.new
	crypted_message.each do |crypted_symbol|
		result = crypted_symbol ** private_key % n 
		decrypted_message.insert(-1, result.chr)
	end
	puts "decrypted message: #{decrypted_message}"
	return decrypted_message
end	

result = generate_keys 7, 13
message = "MESSAGE IN A BOTTLE!"
decrypt (encrypt message, result['public_key'], result['n']), result['private_key'], result['n']
