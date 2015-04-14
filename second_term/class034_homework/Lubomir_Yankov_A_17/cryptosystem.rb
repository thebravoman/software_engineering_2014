require 'prime'

class RSA
	
	class << self
	
		def coprime?(a, b)
			1 == extended_gcd(a,b)
		end
		
		def generate_numbers		
			[random_prime, random_prime]
		end
		
		def random_prime
			r = rand(10..100)
			while(!Prime.prime?(r)) do  
				r = rand(100) 
			end
			r
		end
		
		def get_n(array)
			array[0] * array[1]
		end
		
		def get_phy_n(array)
			phy_n = ((array[0]-1) * (array[1]-1))
		end
		
		def get_public_key_number(phy_n)
			e = rand(1...phy_n)
			while((!coprime?(phy_n, e)) & !Prime.prime?(e)) do
				e = rand(1...phy_n)
			end
			e
		end
		
		def extended_gcd(a, b)
			return [0,1] if a % b == 0
			x, y = extended_gcd(b, a % b)
			[y, x - y * (a / b)]
		end
		
		def get_private_key_number(phy_n, e)
			x, y = extended_gcd(e, phy_n) 
			x += phy_n if x < 0
			x
		end
		
		def generate_keys
			numbers = generate_numbers
			n = get_n(numbers)
			phy_n = get_phy_n(numbers)
			e = get_public_key_number(phy_n)
			d = get_private_key_number(phy_n, e)
			[e, d, n]
		end

		def print_keys(e, d, n)				
			puts "\nThe public key is: (#{e}, #{n})"
			puts "The private key is: (#{d}, #{n})"
		end
		
		def encrypt(text, e, n)
			string_to_bytes(text, e, n)
		end
		
		def decrypt(text, d, n)
			bytes_to_string(text, d, n)
		end
		
		def string_to_bytes(string, e, n)
			bytes = []
			string.each_byte do |byte|
				bytes << byte.to_i**e.to_i % n.to_i
			end
			bytes
		end
		
		def bytes_to_string(bytes, d, n)
			chars = []
			bytes.each do |byte|
				chars << (byte.to_i**d.to_i % n.to_i).chr(Encoding::UTF_8)
			end
			chars.join("")
		end
	end
end