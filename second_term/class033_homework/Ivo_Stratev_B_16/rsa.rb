require 'prime.rb'

module Rsa
	class Key_generator

		def generate_e which, g
			j = i = 0	
			while j < which
				i += 1
				if Prime.prime?(i) && g.gcd(i) == 1 then j += 1 end
			end
	
			return i
		end

		def generate_d e, g
			d = 1
			while true
				if (d*e) % g == 1 then return d end
		
				d += 1
			end
		end

		def generate_keys p, q, which_e
			generated = Hash.new
			n = p*q
			g = (p - 1)*(q - 1)
			e = generate_e which_e, g
			d = generate_d e, g
			
			puts "public key: #{e}"
			puts "private key: #{d}"
			generated = {"public_key" => e, "private_key" => d, "n" => n}
		end
	end

	class Crypter
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
	end
end

generator = Rsa::Key_generator.new
crypt = Rsa::Crypter.new
result = generator.generate_keys 7, 13, 1
message = "#I'M THE@MASTER OF   RU-BY."
encrypted_message = crypt.encrypt message, result['public_key'], result['n']
decrypted_message = crypt.decrypt encrypted_message, result['private_key'], result['n']
