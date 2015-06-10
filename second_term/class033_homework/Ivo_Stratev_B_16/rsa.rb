require 'prime.rb'
require_relative 'symbol.rb'

module Rsa
	class Generator
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
			puts "n: #{n}"
			generated = {"public_key" => e, "private_key" => d, "n" => n}
		end
	end

	class Crypter
		def encrypt message, public_key, n
			s = Sym.new
			encrypted_message = String.new
			message.each_byte do |symbol|
				result = s.sym(symbol ** public_key % n)
				encrypted_message << result
			end
			puts "encrypted message: #{encrypted_message}"
			return encrypted_message
		end

		def decrypt crypted_message, private_key, n
			s = Sym.new
			decrypted_message = String.new
			crypted_message.each_byte do |crypted_symbol|
				result = s.sym(crypted_symbol ** private_key % n) 
				decrypted_message << result
			end
			puts "decrypted message: #{decrypted_message}"
			return decrypted_message
		end	
	end
end
